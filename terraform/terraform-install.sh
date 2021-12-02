#!/usr/bin/env bash
set -ex

APT_UP="sudo apt update && sudo apt upgrade -y"

eval $APT_UP

sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

eval $APT_UP

sudo apt-get install terraform
