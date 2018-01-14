#!/bin/bash
## HPL Flop Benchmark for Memory Bandwidth
#

# Look at: http://hpl-calculator.sourceforge.net/


. ./SETUP.sh
#intall helper utilities for spack operation like modules
spack bootstrap

#add mdoule to CLI
source ../spack/share/spack/setup-env.sh

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

#setup decomposeParDict to auto partition and correct core count
cat > system/decomposeParDict << EOF
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      decomposeParDict;
}


numberOfSubdomains $NCPUS;

//method          hierarchical;
method          scotch;
EOF

#run foam
./Allrun

cd ..


echo "######################################################"
echo "======> Start second foam case"
date

#copy in  motorBike example
cp -fr $WM_PROJECT_DIR/tutorials/multiphase/interDyMFoam/ras/DTCHull .

cd DTCHull

sed -i -e 's/numberOfSubdomains 8/numberOfSubdomains '"$NCPUS"'/' system/decomposeParDict

#run foam
./Allrun

echo "======> End second foam case"
date


cd ../../


echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
module rm $MOD $MPI
echo ""
