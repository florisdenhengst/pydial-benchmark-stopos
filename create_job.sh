#!/bin/bash
module load stopos

stopos purge -p pydial-run
stopos create -p pydial-run
stopos add ../pydial/config/pydial_benchmarks/partials/parmset -p pydial-run
