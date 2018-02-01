
## Number of cores/threads in node

#real cores
NCPUS=$(lstopo-no-graphics  --only CORE | wc -l)

echo "System has $NCPUS cores"

#hyperthreads
NTHREADS=$(lstopo-no-graphics  --only PU | wc -l)

echo "System has $NTHREADS threads"

SCFLAGS='-march=native -O2'
SCXXFLAGS='-march=native -O2'
SFFLAGS='-march=native -O2'


## Setup options

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../spack/share/spack/setup-env.sh
