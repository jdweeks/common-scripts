#!/usr/bin/env bash
set -ex

for d in */ ; do
    cp $d*.sh /usr/local/bin
done