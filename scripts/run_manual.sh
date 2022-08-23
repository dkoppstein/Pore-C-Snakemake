#!/usr/bin/env bash
eval "$(conda shell.bash hook)"
conda activate /localenv/koppstein/anaconda/projects/pore-c/65f117d3bfe36f9ae474e4cc2ceb8237 
bwa index results/refgenome/GRCm38.rg.fa 2>results/logs/results/refgenome/GRCm38.rg.fa.bwt.log
