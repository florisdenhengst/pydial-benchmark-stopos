#!/bin/bash
#SBATCH -t 4:00:00
#SBATCH -n 8

nprocs=`cat /proc/cpuinfo | grep processor | wc -l`
echo "using $nprocs processors"
for i in `seq 1 $nprocs`; do
	./run_job.sh &
done
wait
