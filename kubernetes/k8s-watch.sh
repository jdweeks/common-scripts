#!/usr/bin/env bash

kubectl rollout status -w deployment ${1}
