#!/bin/bash

# This script installs the TLS certificate for Pi-Hole to use for HTTPS.

# Generate a combined PEM file containing the signed certificate and the private key
cp pihole-public.crt pihole-combined.pem
cat pihole-private.key >> pihole-combined.pem

# Install the combined PEM file to the Pi-Hole directory and set appropriate permissions
sudo cp pihole-combined.pem /etc/pihole/
sudo chown pihole:pihole /etc/pihole/pihole-combined.pem

# Either configure Pi-Hole to use the new certificate or restart the Pi-Hole service to apply the changes
# This step may vary depending on your Pi-Hole setup.