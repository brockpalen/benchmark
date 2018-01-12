#!/bin/bash

yum -y install gcc gcc-gfortran gcc-c++ file git make which patch bzip2 rsh

git clone https://github.com/spack/spack.git

PATH=$PATH:~/spack/bin

#intall helper utilities for spack operation like modules
spack bootstrap

#add mdoule to CLI
source spack/share/spack/setup-env.sh

# install gcc 6.4.0
time spack install gcc@6.4.0

#load gcc@7.2.0 
GCCMOD=$(module avail gcc-6.4 2>&1 | tail -n 1)
module load $GCCMOD

# make sure spack picks up new gcc7.2 compiler we will use for all other builds
spack compiler find

