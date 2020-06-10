#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -xeuo pipefail
export DEBIAN_FRONTEND=noninteractive
echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' | 
    sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install \
     --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
     build-essential cmake git libjson-c-dev libwebsockets-dev  \
     busybox gcc fakeroot fakechroot debootstrap
# golang-go is 1.11 in buster but gvisor needs 1.14
sudo apt-get install \
     --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
     -t buster-backports golang-go

