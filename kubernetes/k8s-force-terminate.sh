#!/usr/bin/env bash

stuck=$(kubectl get pods | grep Terminating | awk '{ print $1 }')

for i in "${stuck[@]}"
do 
  echo "force terminating pod " + $i
  kubectl delete pod --force $i
done

