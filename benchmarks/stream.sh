#!/bin/bash
## Stream Benchmark for Memory Bandwidth
#

source ./SETUP.sh

#intall helper utilities for spack operation like modules
spack bootstrap

time spack install stream@5.10%gcc@6.2.0 +openmp cppflags='-DSTREAM_ARRAY_SIZE=45088768'

MOD=$(module avail stream 2>&1 | tail -n 1)
module load $MOD

echo "######################################################"
echo ""
echo "=======> Starting: $MOD"
date

time stream_c.exe


echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
module rm $MOD
echo ""
