#!/usr/bin/env bash
eval "$(conda shell.bash hook)"
mkdir -p results/logs/results/basecall
conda activate /localenv/koppstein/anaconda/projects/pore-c/47303ceff4627043e48e745569489f65 
pore_c --dask-scheduler-port 0 --dask-num-workers 16 reads prepare /data/manke/processing/koppstein/pore-c/resources/Project_2372_Sun_Akhtar/Sample_22L000110/NPCs_Control_DpnII.fastq.gz results/basecall/DpnII_run01.rd --max-read-length 100000  --batch-size 50000 2>results/logs/results/basecall/DpnII_run01.rd.catalog.yaml.log
#bwa index results/refgenome/GRCm38.rg.fa 2>results/logs/results/refgenome/GRCm38.rg.fa.bwt.log
