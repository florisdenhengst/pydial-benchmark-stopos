#!/bin/bash

module load stopos

NR_LINES=`cat ${HOME}/projects/pydial/config/pydial_benchmarks/partials/parmset | wc -l`
# TODO: infer automatically
NR_PROCS=16
let NR_NODES=${NR_LINES} / NR_PROCS

echo "$NR_NODES"

sbatch -a 0-$NR_NODES ./job.sh
