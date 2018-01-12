#!/bin/bash
## HPL Flop Benchmark for Memory Bandwidth
#

# Look at: http://hpl-calculator.sourceforge.net/


. ./SETUP.sh
#intall helper utilities for spack operation like modules
spack bootstrap

#add mdoule to CLI
source /root/spack/share/spack/setup-env.sh

FORCE_UNSAFE_CONFIGURE=1 spack install --no-checksum openfoam-org@4.1%gcc@6.4.0

MOD=$(module avail openfoam-org 2>&1 | tail -n 1)
MPI=$(module avail openmpi 2>&1 | tail -n 1)
module load $MOD $MPI

# openfoam tutorial envrionment is picky
source $WM_PROJECT_DIR/etc/bashrc

echo "######################################################"
echo ""
echo "=======> Starting: $MOD"
date

cd openfoam

#copy in  motorBike example
cp -fr $WM_PROJECT_DIR/tutorials/incompressible/simpleFoam/motorBike .

cd motorBike

./Allrun
cd ../../


echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
module rm $MOD $MPI
echo ""
