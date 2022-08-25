#!/usr/bin/env bash
# combine both NlaIII runs

mkdir -p ../../resources/nanopore_data/NlaIII_combined

cat ../../resources/nanopore_data/20220816_1417_X2_FAU48766_625822b5/Project_2372_Sun_Akhtar/Sample_22L000111/NPCs_Control_NlaIII.fastq.gz ../../resources/nanopore_data/20220817_1050_X2_FAU48766_b3342a18/Project_2372_Sun_Akhtar/Sample_22L000111/NPCs_Control_NlaIII.fastq.gz > ../../resources/nanopore_data/NlaIII_combined/NPCs_Control_NlaIII_combined.fastq.gz 

mkdir -p ../../resources/nanopore_data/NlaIII_combined/fast5


ln -sf --relative ../../resources/nanopore_data/20220816_1417_X2_FAU48766_625822b5/fast5_pass/*.fast5 ../../resources/nanopore_data/20220817_1050_X2_FAU48766_b3342a18/fast5_pass/*.fast5 ../../resources/nanopore_data/NlaIII_combined/fast5/

head -n 1 ../../resources/nanopore_data/20220816_1417_X2_FAU48766_625822b5/sequencing_summary_FAU48766_97cfce09.txt > ../../resources/nanopore_data/NlaIII_combined/combined_sequencing_summary.txt
tail -n +2 -q ../../resources/nanopore_data/20220816_1417_X2_FAU48766_625822b5/sequencing_summary_FAU48766_97cfce09.txt >> ../../resources/nanopore_data/NlaIII_combined/combined_sequencing_summary.txt
tail -n +2 -q ../../resources/nanopore_data/20220817_1050_X2_FAU48766_b3342a18/sequencing_summary_FAU48766_6db71392.txt >> ../../resources/nanopore_data/NlaIII_combined/combined_sequencing_summary.txt
