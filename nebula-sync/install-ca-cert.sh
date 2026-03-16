#!/bin/bash

# Installs the CA certificate on the server
# to allow Nebula Sync to recognize the TLS certificates
# of the Pi-Hole instances.

# Ensures that ca-certificates package is installed.
# No-op if it is already installed.
sudo apt install -y ca-certificates

# Copies the CA certificate to the appropriate directory.
sudo cp CA-public.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
