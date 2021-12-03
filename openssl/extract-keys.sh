#!/usr/bin/env bash
set -ex

target=${1}

openssl pkcs12 -in ${target}.pfx -nocerts -out key.pem -nodes
openssl pkcs12 -in ${target}.pfx -nokeys  -out cert.pem
openssl rsa -in key.pem -out client.key 

base64 -i cert.pem -o cert.pem.b64
base64 -i client.key -o client.key.b64

