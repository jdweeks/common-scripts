#!/usr/bin/env bash
set -ex

az network application-gateway ssl-cert delete --ids "${1}"
