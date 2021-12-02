#!/usr/bin/env bash
set -x

configs=$(kubectl get configmap -l app=$1 | awk '{ print $1 }')

for i in "${configs[@]}"
do 
  kubectl delete configmap $i
done

kubectl delete all -l app=$1
