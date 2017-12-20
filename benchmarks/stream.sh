#!/bin/bash
## Stream Benchmark for Memory Bandwidth
#

#intall helper utilities for spack operation like modules
spack bootstrap

#add mdoule to CLI
source /root/spack/share/spack/setup-env.sh


time spack install stream@5.10%gcc@7.2.0 +openmp

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
