#!/usr/bin/env bash
set -ex

sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.21.0
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
