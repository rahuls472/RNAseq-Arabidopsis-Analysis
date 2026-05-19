#!/bin/bash

featureCounts \
-T 4 \
-a ~/Downloads/Unix/rnaseq_project/reference/Arabidopsis_thaliana.TAIR10.59.gtf \
-o ~/Downloads/Unix/rnaseq_project/results/gene_counts.txt \
~/Downloads/Unix/rnaseq_project/results/SRR18297038_1.sorted.bam \
~/Downloads/Unix/rnaseq_project/results/SRR18297042_1.sorted.bam