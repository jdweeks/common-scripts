#!/usr/bin/env bash

kubectl get ${1} --no-headers -o name | awk -F / '{print $2}' | grep ${2}
