#!/bin/bash

# This script installs Golang on the server.
# Nebula Sync is written in Golang, so this is a prerequisite for running Nebula Sync.

# Detect System Architecture
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case $ARCH in
    x86_64)  ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) echo "❌ Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Download and Install
FILENAME="${LATEST_VER}.${OS}-${ARCH}.tar.gz"
URL="https://go.dev/dl/$FILENAME"

echo "Downloading $URL"
curl -LO "$URL"

echo "Installing"
# Remove old version and extract new one
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$FILENAME"

# Cleanup downloaded file
rm "$FILENAME"

# Generate the golang.sh file
sudo tee /etc/profile.d/golang.sh <<EOF
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
EOF
