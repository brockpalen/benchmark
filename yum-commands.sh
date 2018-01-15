#!/bin/bash

#minimum required to operate suite
yum -y install gcc gcc-gfortran gcc-c++ file git make which patch bzip2 rsh which hwloc screen

useradd brockp -u 158765
su - brockp
cd

