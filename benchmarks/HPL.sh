#!/bin/bash
## HPL Flop Benchmark for Memory Bandwidth
#

# Look at: http://hpl-calculator.sourceforge.net/


. ./SETUP.sh
#intall helper utilities for spack operation like modules
spack bootstrap

#add mdoule to CLI
source /root/spack/share/spack/setup-env.sh

time spack install hpl@2.2%gcc@7.2.0

MOD=$(module avail hpl 2>&1 | tail -n 1)
MPI=$(module avail openmpi 2>&1 | tail -n 1)
module load $MOD $MPI

echo "######################################################"
echo ""
echo "=======> Starting: $MOD"
date

cd HPL
mpirun --allow-run-as-root -np $NCPUS xhpl
cd ..


echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
module rm $MOD $MPI
echo ""
