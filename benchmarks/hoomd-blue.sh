#!/bin/bash
## Hoomd-blue benchmark
#


source ./SETUP.sh
#intall helper utilities for spack operation like modules
spack bootstrap

spack install hoomd-blue@2.2.2%gcc@6.4.0 cflags=$SCFLAGS cxxflags=$SCXXFLAGS

MOD=$(module avail hoomd-blue 2>&1 | tail -n 1)
MPI=$(module avail openmpi 2>&1 | tail -n 1)
PYTHON=$(module avail python-2 2>&1 | tail -n 1)
NUMPY=$(module avail py-numpy 2>&1 | tail -n 1)
module load $MOD 


#build PYTHONPATH manually
#export PYTHONPATH=/home/centos/benchmark/spack/opt/spack/linux-centos7-x86_64/gcc-6.4.0/hoomd-blue-2.2.2-4pj6pubzdfilz3e7hc3fip6ujmbeyy3r/
export PYTHONPATH=$(echo $PYTHONPATH | awk -F'lib' '{print $1}')

module rm $MOD
module load $PYTHON $NUMPY $MPI

echo $PYTHONPATH

cd hoomd-blue

echo "######################################################"
echo ""
echo "=======> Starting: $MOD"
date

time mpirun -np $NCPUS python bmark.py

cd ..

echo "######################################################"
echo ""
date
echo "=======> Ending: $MOD"
unset PYTHONPATH
module rm $PYTHON $NUMPY $MPI
echo ""

