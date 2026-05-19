#!/bin/bash

ref=~/Downloads/Unix/rnaseq_project/reference
data=~/Downloads/Unix/rnaseq_project/data
output=~/Downloads/Unix/rnaseq_project/results

for sample in SRR18297038_1 SRR18297042_1
do
    echo "Processing $sample..."

    hisat2 \
    -p 4 \
    -x $ref/ath_index \
    -U $data/${sample}.fastq \
    -S $output/${sample}.sam

    echo "$sample alignment completed."
done
