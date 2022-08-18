#!/usr/bin/env bash
snakemake --use-conda -j 4 -R add_refgenome --until bwa_index_refgenome --profile mpi-ie-slurm --conda-prefix /localenv/koppstein/anaconda/projects/pore-c

