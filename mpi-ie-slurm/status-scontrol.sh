#!/usr/bin/env bash
set -eu

# load slurm
module load slurm

# Check status of Slurm job

jobid="$1"

if [[ "$jobid" == Submitted ]]
then
  echo mpi-slurm: Invalid job ID: "$jobid" >&2
  echo mpi-slurm: Did you remember to add the flag --parsable to your sbatch call? >&2
  exit 1
fi

output=`scontrol -o show job "$jobid" | sed "s/^.*JobState\=\(\S*\).*$/\1/"`

if [[ $output =~ ^(COMPLETED).* ]]
then
  echo success
elif [[ $output =~ ^(RUNNING|PENDING|COMPLETING|CONFIGURING|SUSPENDED).* ]]
then
  echo running
else
  echo failed
fi
