# Benchamark Setup script for RHEL7/CentOS 7

Setup in Docker

```
docker pull centos

#run container with bash shell with this repo as /root
docker run --rm -i -t -v <localpath>:/root  centos /bin/bash
```

Then to start environment source `brockp-bench.sh`

This will setup spack, add to environment and start build of GCC 7 and a few applications

## TODO's

* Break building of compilers and such into own package
* Make `benchmarks` directory with scripts, inputs and README's for different applications
