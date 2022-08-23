#!/usr/bin/env bash
mkdir -p /data/extended/koppstein/pore-c/results/refgenome
mkdir -p /data/extended/koppstein/pore-c/results/virtual_digest/
cp results/refgenome/GRCm38.rg.fa /data/extended/koppstein/pore-c/results/refgenome/GRCm38.rg.fa
eval "$(conda shell.bash hook)"
conda activate /localenv/koppstein/anaconda/projects/pore-c/47303ceff4627043e48e745569489f65 
pore_c --dask-scheduler-port 0 --dask-num-workers 1 refgenome virtual-digest /data/extended/koppstein/pore-c/results/refgenome/GRCm38.rg.fa DpnII /data/extended/koppstein/pore-c/results/virtual_digest/DpnII_GRCm38.vd -n 1 2> results/logs/results/virtual_digest/DpnII_GRCm38.vd.catalog.yaml.log
