#!/usr/bin/env bash

set -ex

apt-get update --yes
apt-get install --yes --no-install-recommends build-essential ca-certificates cmake libboost-all-dev unzip wget
cd /tmp
wget https://github.com/nicehash/nheqminer/archive/Linux.zip
unzip -q Linux.zip
cd nheqminer-Linux/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)
./nheqminer_cpu -l eu1-zcash.flypool.org:3333 -u "t1TwoYzvNz5tzXW65xRsarrqTFAhb4eJSP6.$1"
