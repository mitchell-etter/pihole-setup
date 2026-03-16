#!/bin/bash

# This script installs Nebula Sync on the server as a service.

# Download and install Nebula Sync for the current user.
go install github.com/lovelaze/nebula-sync@latest

# Copy the package to a place for all users
sudo cp "$(go env GOPATH)/bin/nenbula-sync" /usr/local/bin/

# Generate a configuration file for Nebula Sync.
# Assumes that app passwords have already been created throught the Pi-Hole UI.
# Replace `password` with the actual app passwords for each Pi-Hole instance.
sudo tee /etc/nebula-sync.env <<EOF
PRIMARY=https://pihole-1|password
REPLICAS=https://pihole-2|password
FULL_SYNC=true
RUN_GRAVITY=false
CRON=0 * * * *
EOF

# Creates a user for Nebula Sync
sudo useradd -r -s /sbin/nologin nebula-sync

# Creates a systemd service configuration for Nebula Sync
sudo tee /etc/systemd/system/nebula-sync.service <<EOF
[Unit]
Description=Nebula Sync
ConditionPathExists=/usr/local/bin/nebula-sync
# Needs the network
Wants=network-online.target
After=network-online.target
# Pi-hole needs to be started first
# only because this is on the secondary Pi-hole host.
Wants=pihole-FTL.service
After=pihole-FTL.service

[Service]
User=nebula-sync
ExecStart=/usr/local/bin/nebula-sync run
ExecStop=/bin/kill \$MAINPID
EnvironmentFile=/etc/nebula-sync.env
# Protect system folders
ProtectSystem=full

[Install]
WantedBy=multi-user.target
EOF

# Loads the service configuration
sudo systemctl daemon-reload

# Enables and starts the Nebula Sync service
sudo systemctl enable nebula-sync
sudo systemctl start nebula-sync
