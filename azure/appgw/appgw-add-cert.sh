#!/usr/bin/env bash
set -ex

certName=${4}
vaultName=${3}

resgp=${1}
appgwName=${2}

versionedSecretId=$(az keyvault certificate show -n $certName --vault-name $vaultName --query "sid" -o tsv)
unversionedSecretId=$(echo $versionedSecretId | cut -d'/' -f-5) # remove the version from the url

az network application-gateway ssl-cert create -n $certName --gateway-name $appgwName --resource-group $resgp --key-vault-secret-id $unversionedSecretId

