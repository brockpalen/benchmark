from __future__ import division, print_function

import hoomd
import hoomd.md
import numpy
import os
import sys
import math

context = hoomd.context.initialize()
l = 32
phi = 0.442022086;
a = (1/6*math.pi / phi)**(1/3)

unitcell=hoomd.lattice.sc(a=a, type_name='A')
hoomd.init.create_lattice(unitcell=unitcell, n=l)

nl = hoomd.md.nlist.cell()
lj = hoomd.md.pair.lj(r_cut=2.5, nlist=nl)
lj.pair_coeff.set('A', 'A', epsilon=1.0, sigma=0.8)

all = hoomd.group.all()
hoomd.md.integrate.mode_standard(dt=0.005)
nvt = hoomd.md.integrate.langevin(group=all, kT=1.2, seed=4)
zero = hoomd.md.update.zero_momentum(period=100)

# grow the particles up to full size slowly to avoid blowing up the system
for s in numpy.linspace(0.8, 1.0, 30):
    lj.pair_coeff.set('A', 'A', sigma=s)
    hoomd.run(100, quiet=True)

# equilibrate for a bit
nvt.disable()
zero.disable()
hoomd.md.integrate.nvt(group=all, kT=1.2, tau=0.5)
hoomd.run(4000);


nl.set_params(r_buff=0.6, check_period=7)

# run a short warm up for CPU jobs and a long warm up for GPU jobs
if context.on_gpu():
    hoomd.run(30000)
else:
    hoomd.run(30000, limit_hours=20.0/3600.0)
hoomd.option.set_autotuner_params(enable=False)

# full benchmark
tps = hoomd.benchmark.series(warmup=0, repeat=1, steps=500000)
#tps = hoomd.benchmark.series(warmup=0, repeat=1, steps=50000, limit_hours=20.0/3600.0)

tps = numpy.average(tps)

# rank 0 writes out TPS information
if hoomd.comm.get_rank() == 0:
    print()
    print("Average:", tps, "steps per second")
