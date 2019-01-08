#!/bin/bash
module load stopos
module load python/2.7.9

source ~/venvs/pydial/bin/activate
PYDIAL_BASE="${TMPDIR}/pydial/"
CONF_DIR="${PYDIAL_BASE}config/pydial_benchmarks/partials/dest/"
PYDIAL_COMMAND="time python ${PYDIAL_BASE}pydial.py train"
STOPOS_BASE="${HOME}/projects/pydial-stopos/"
STDOUT_DIR="${HOME}/projects/pydial-stopos/results/stdout/"
STDERR_DIR="${HOME}/projects/pydial-stopos/results/stderr/"


STOPOS_RC="OK"
while [ "$STOPOS_RC" == "OK" ]; do
	stopos -p pydial-run next
	if [ "$STOPOS_RC" == "OK" ]; then
		a=( $STOPOS_VALUE )
		# create path to script
		log_base=$(python join.py $STOPOS_VALUE)
		# the last item of the STOPOS_VALUE variable array contains the random seed
		stdout_target="${log_base}-${a[-1]}-stdout"
		stderr_target="${log_base}-${a[-1]}-stderr"
		command="pushd $PYDIAL_BASE && $PYDIAL_COMMAND ${CONF_DIR}${log_base}.cfg --seed=${a[-1]} > $stdout_target 2> $stderr_target && popd"
		echo "$command"
		$(eval $command)
		stopos remove -p pydial-run
		mv ${stdout_target} ${STDOUT_DIR}
		mv ${stderr_target} ${STDERR_DIR}
	fi
done