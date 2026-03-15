# Pi-Hole Certificates

This directory contains information about setting up certificates to be used by Pi-Hole for HTTPS.

Assumptions:

- A private certificate authority (CA) is being used to generate certificates.
- Pi-Hole version 6.0 or later is being used, which supports direct certificate configuration.

## Scripts

The following scripts are used for generating TLS certificates for Pi-Hole:

1. `generate-CA-cert.sh`: Generates a private CA certificate and key. It should be run once to create the CA.

1. `create-csr.sh`: Creates a private server key and a certificate signing request (CSR) for the server. It should be run each time a new certificate is needed for Pi-Hole.

1. `sign-csr.sh`: Signs the CSR using the CA certificate and key. It produces a signed public server certificate.

1. `install-cert.sh`: Installs the server certificate to be used by Pi-Hole.
