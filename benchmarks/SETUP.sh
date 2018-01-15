
## Number of cores/threads in node

#real cores
NCPUS=$(lstopo-no-graphics  --only CORE | wc -l)

#hyperthreads
# NCPUS=$(lstopo-no-graphics  --only PU | wc -l)


## Setup options

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../spack/share/spack/setup-env.sh
