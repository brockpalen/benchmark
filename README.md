# Benchamark Setup script for RHEL7/CentOS 7

Setup in Docker

```
docker pull centos

#run container with bash shell with this repo as /home/brockp
docker run --rm -i -t -v <localpath>:/home/brockp  centos /bin/bash
```

Then to insert deps run `bash /home/brockp/yum-commands.sh`

To setup the environment `source setup.sh`

This will setup install system deps, add a user brockp 
Setup spack, add to environment and start build of GCC 6 and a few applications

Each application has it's own setup and run in the `benchmarks` folder.  Be sure to look in `SETUP.sh` for global settings

## TODO's

* Break building of compilers and such into own package
* Make `benchmarks` directory with scripts, inputs and README's for different applications
