#!/usr/bin/env bash
set -ex

resourceGroup=${1}
gatewayName=${2}

az network application-gateway ssl-cert list --resource-group ${resourceGroup} --gateway-name ${gatewayName} 
