#!/usr/bin/env bash
set -eu

# load slurm
module load slurm

scancel $@
