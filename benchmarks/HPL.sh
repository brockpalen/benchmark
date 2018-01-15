#!/bin/bash
## HPL Flop Benchmark for Memory Bandwidth
#

# Look at: http://hpl-calculator.sourceforge.net/


source ./SETUP.sh
#intall helper utilities for spack operation like modules
spack bootstrap

time spack install hpl@2.2%gcc@6.4.0

MOD=$(module avail hpl 2>&1 | tail -n 1)
MPI=$(module avail openmpi 2>&1 | tail -n 1)
module load $MOD $MPI

echo "######################################################"
echo ""
echo "=======> Starting: $MOD"
date

cd HPL
time mpirun --allow-run-as-root -np $NCPUS xhpl
cd ..


echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
module rm $MOD $MPI
echo ""
