#!/usr/bin/env bash
snakemake --use-conda -j 4 -R add_refgenome --omit-from haplotag --profile mpi-ie-slurm --conda-prefix /localenv/koppstein/anaconda/projects/pore-c
