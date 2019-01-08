#!/bin/bash

module load stopos

NR_LINES=`cat ${HOME}/projects/pydial/config/pydial_benchmarks/partials/parmset | wc -l`
# TODO: infer automatically
NR_PROCS=16
NR_NODES=`python n_nodes.py $NR_LINES $NR_PROCS`
echo "NR of nodes: $NR_LINES / $NR_PROCS = $NR_NODES"

sbatch -a 0-$NR_NODES ./job.sh
