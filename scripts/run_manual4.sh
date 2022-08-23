#!/usr/bin/env bash
#SBATCH --job-name=serial_job_test    # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=koppstein@ie-freiburg.mpg.de     # Where to send mail	
#SBATCH --cpus-per-task=16                    # Run on a single CPU
#SBATCH --output=serial_test_%j.log   # Standard output and error log
#SBATCH --array=1-16
#SBATCH --mem-per-cpu=4000
#SBATCH --error=serial_test_%j.err
mkdir -p results/logs/results/mapping
mkdir -p results/mapping
eval "$(conda shell.bash hook)"
export TMPDIR=/data/extended
conda activate /localenv/koppstein/anaconda/projects/pore-c/65f117d3bfe36f9ae474e4cc2ceb8237 

i=$SLURM_ARRAY_TASK_ID

( bwa bwasw -b 5 -q 2 -r 1 -T 15 -z 10 -t 16 results/refgenome/GRCm38.rg.fa results/basecall/DpnII_run01.rd.batch${i}.fq.gz  | pore_c alignments reformat-bam - -  | samtools sort -O bam -m 4G -@ 16 -T $TMPDIR -o results/mapping/DpnII_run01_batch${i}_GRCm38.coord_sort.bam -) 2>results/logs/results/mapping/DpnII_run01_batch${i}_GRCm38.coord_sort.bam.log ; samtools index results/mapping/DpnII_run01_batch${i}_GRCm38.coord_sort.bam 2>results/logs/results/mapping/DpnII_run01_batch${i}_GRCm38.coord_sort.bam.log
