#!/bin/bash

# This script signs a Certificate Signing Request (CSR) as the Certificate Authority (CA) and generates a signed certificate.

#generate configuration for the certificate
cat > cert.conf <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = pihole

EOF

#create the signed certificate
openssl x509 -req -in pihole.csr \
  -CA CA-public.crt -CAkey CA-private.key -CAcreateserial \
  -out pihole-public.crt -days 730 -sha256 -extfile cert.conf
  