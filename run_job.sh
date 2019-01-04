#!/bin/bash
module load stopos
module load python/2.7.9

source ~/venvs/pydial/bin/activate
PYDIAL_BASE="${HOME}/projects/pydial/"
CONF_DIR="${PYDIAL_BASE}config/pydial_benchmarks/partials/dest/"
PYDIAL_COMMAND="python ${PYDIAL_BASE}pydial.py train"
STOPOS_BASE="${HOME}/projects/pydial-stopos/"
STDOUT_DIR="${HOME}/projects/pydial-stopos/results/stdout/"
STDERR_DIR="${HOME}/projects/pydial-stopos/results/stderr/"


STOPOS_RC="OK"
while [ "$STOPOS_RC" == "OK" ]; do
	stopos -p pydial-run next
	if [ "$STOPOS_RC" == "OK" ]; then
		# create path to script
		log_base=$(python join.py $STOPOS_VALUE)
		command="pushd $PYDIAL_BASE && $PYDIAL_COMMAND ${CONF_DIR}${log_base}.cfg > ${STDOUT_DIR}${log_base} 2> ${STDERR_DIR}${log_base} && popd"
		$(eval $command)
	fi
done
