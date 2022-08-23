#!/usr/bin/env bash
mkdir -p results/logs/results/mapping
mkdir -p results/mapping
eval "$(conda shell.bash hook)"
export TMPDIR=/data/extended
conda activate /localenv/koppstein/anaconda/projects/pore-c/65f117d3bfe36f9ae474e4cc2ceb8237 
for i in $(seq 1 16); do
	SlurmEasy -M -t 16 "'( bwa bwasw -b 5 -q 2 -r 1 -T 15 -z 10 -t 16 results/refgenome/GRCm38.rg.fa results/basecall/DpnII_run01.rd.batch${i}.fq.gz  | pore_c alignments reformat-bam - -  | samtools sort -O bam -m 4G -@ 16 -T $TMPDIR -o results/mapping/DpnII_run01_batch9_GRCm38.coord_sort.bam -) 2>results/logs/results/mapping/DpnII_run01_batch9_GRCm38.coord_sort.bam.log ; samtools index results/mapping/DpnII_run01_batch9_GRCm38.coord_sort.bam 2>results/logs/results/mapping/DpnII_run01_batch9_GRCm38.coord_sort.bam.log'"
done;
#bwa index results/refgenome/GRCm38.rg.fa 2>results/logs/results/refgenome/GRCm38.rg.fa.bwt.log
