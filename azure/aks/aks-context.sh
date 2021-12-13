#!/usr/bin/env bash
set -ex

sub=$1
resgp=$2
cluster=$3
extra=$4

az aks get-credentials -n "${cluster}" -g "${resgp}" --subscription "${sub}" "${extra}"
