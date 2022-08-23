#!/usr/bin/env bash
# reformat hicpro-output vcf to standard VCF 
# convert spaces to tabs on header line
# convert multiple spaces to tabs on rest of lines
sed '/^#CHROM/ s/ /\t/g' - | sed '/^#/!s/ \+ /\t/g' 
