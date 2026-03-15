#!/bin/bash

# Generates a CA certificate for used on the local network.
openssl req -x509 -sha256 -days 1825 -nodes -newkey rsa:2048 \
  -subj "/CN=mynetwork/C=US/L=Cincinnati" \
  -keyout CA-private.key -out CA-public.crt
