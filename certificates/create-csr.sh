#!/bin/bash

# This script creates a private key and a certificate signing request (CSR) for a server.

#generate private key for Pi-hole server
openssl genrsa -out pihole-private.key 2048

#generate certificate signing request (CSR) configuration
cat > csr.conf <<EOF

[ req ]
default_bits = 4096
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = US
ST = Ohio
L = Cincinnati
CN = pihole

[ req_ext ]
subjectAltName = @alt_names
                           
[ alt_names ]              
DNS.1 = pihole
IP.1 = 192.168.1.101

EOF

#generate CSR
openssl req -new -key pihole-private.key \
  -out pihole.csr -config csr.conf
