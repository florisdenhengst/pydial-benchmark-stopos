#!/bin/bash
#SBATCH -t 99:00:00
#SBATCH -N 1
#SBATCH --mail-user=florisdenhengst@gmail.com
#SBATCH --mail-type=ALL

module load sara-batch-resources
module load python/2.7.9

cd "$TMPDIR"
rm -rf pydial
cp -r "${HOME}/projects/pydial" .
cp -r ${HOME}/projects/pydial-stopos/*.sh .
cp -r ${HOME}/projects/pydial-stopos/*.py .
rm -rf _benchmarklogs/*
rm -rf _benchmarkpolicies/*

PYDIAL_BASE="${TMPDIR}/pydial/"

# TODO: do not rely on hardcoded value
nprocs=16
for i in `seq 1 $nprocs`; do
	./task.sh &
done
wait

rm -rf pydial
