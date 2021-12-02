#!/usr/bin/env bash

# Requires lima and docker-cli to be installed:
#   brew install docker
#   brew install lima
#
# Set the DOCKER_HOST envvar like so:
#   export DOCKER_HOST=unix://$HOME/docker.sock

# Start the VM
limactl start

# Setup Lima VM for docker
# https://medium.com/@AkihiroSuda/containerd-doesnt-provide-docker-rest-api-so-you-ll-have-to-install-docker-moby-or-recent-46de2778b928
curl -fsSL https://get.docker.com | lima

# Start rootless docker daemon in lima
lima dockerd-rootless-setuptool.sh install

# Remove old mount if exists
rm -f ~/docker.sock

# Mount the docker socket of lima for OSX over SSH
ssh -p 60022 -i ~/.lima/_config/user -o NoHostAuthenticationForLocalhost=yes -L ~/docker.sock:/run/user/$(id -u)/docker.sock 127.0.0.1
