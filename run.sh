#!/usr/bin/env bash
snakemake --use-conda  test -j 4 --config=output_dir=results.test --profile mpi-ie-slurm --conda-prefix /localenv/koppstein/anaconda/projects/pore-c
