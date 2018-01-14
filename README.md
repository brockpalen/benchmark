# Benchamark Setup script for RHEL7/CentOS 7

After cloning be sure to set values in `benchmarks/SETUP.sh` for your system type.  Some benchmarks like HPL require complex inputs that are not auto generated.

## Setup in Docker

```
docker pull centos

#run container with bash shell with this repo as /home/brockp
docker run --rm -i -t -v <localpath>:/home/brockp  centos /bin/bash
```

Then to insert deps run `bash /home/brockp/yum-commands.sh`

To setup the environment `source setup.sh`

This will setup install system deps, add a user brockp 
Setup spack, add to environment and start build of GCC 6 and a few applications

Each application has it's own setup and run in the `benchmarks` folder.  Be sure to look in `SETUP.sh` for global settings.

## VM CentOS Startup

To make quick testing on different VM providers a set of [Terraform](http://terraform.io/) scripts is in the `terraform` folder.  Exit `main.tf`  to include the different providers you need. Follow their standard instructions to aquire the needed key to automate with these scripts.

Each provider module has an `inputs.tf` with descriptions for options describing how to change common options such as VM instance type.

## TODO's

* Break building of compilers and such into own package
* Make `benchmarks` directory with scripts, inputs and README's for different applications
* Add AWS VM Startup
* Add Azure VM Startup
