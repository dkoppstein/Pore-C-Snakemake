#!/usr/bin/env bash
snakemake --profile /data/manke/group/koppstein/src/github.com/dkoppstein/mpi-ie-slurm/mpi-ie-slurm --use-conda -j 64 --cores 64 --conda-prefix /localenv/koppstein/anaconda/projects/pore-c all cooler
