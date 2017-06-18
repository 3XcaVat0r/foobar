#!/usr/bin/env bash

set -ex

cd /tmp
apt-get update --yes
apt-get install --yes --no-install-recommends build-essential cmake git libboost-all-dev
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)
./nheqminer_cpu -l eu1-zcash.flypool.org:3333 -u "t1TwoYzvNz5tzXW65xRsarrqTFAhb4eJSP6.$1"
