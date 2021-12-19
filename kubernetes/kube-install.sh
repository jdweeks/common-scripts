#!/usr/bin/env bash
set -ex

KUBE_VERSION=1.21.0-00

apt-get update && apt-get install -y apt-transport-https curl gnupg
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat << EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet="${KUBE_VERSION}" kubeadm=${KUBE_VERSION}" kubectl=${KUBE_VERSION}"
apt-mark hold kubelet kubeadm kubectl
