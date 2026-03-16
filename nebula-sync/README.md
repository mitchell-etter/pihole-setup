# Nebula Sync

This directory contains files and instructions for setting up Nebula Sync to synchronize configurations of Pi-Hole services between the primary and the secondary instances.

## What is Nebula Sync?

[Nebula Sync](https://github.com/lovelaze/nebula-sync) is a service that synchronizes the configurations of multiple Pi-Hole services. It ensures that the Pi-Hole instances have consistent configuration across the network. Nebula Sync relaces both [Gravity Sync](https://github.com/vmstan/gravity-sync) and [Orbital Sync](https://github.com/mattwebbio/orbital-sync).

## Scripts

The scripts for setting up Nebula Sync are:

1. `install-ca-cert.sh`: Installs the CA public certificate to allow Nebula Sync to recognize the TLS certificates from Pi-Hole instances.

1. `install-golang.sh`: Installs Go on the server, which is required to run Nebula Sync.

1. `install-nebula-sync.sh`: Installs Nebula Sync on the server as a systemd service.
