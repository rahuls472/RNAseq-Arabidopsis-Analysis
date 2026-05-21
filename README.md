# RNAseq-Arabidopsis-Analysis

## RNA-seq Differential Gene Expression Analysis of *Arabidopsis thaliana* Under Drought Stress

---

## Project Overview

This project demonstrates an end-to-end RNA-seq bioinformatics workflow for identifying differential gene expression patterns in *Arabidopsis thaliana* under drought stress conditions.

The complete analysis pipeline was implemented using Linux, Bash scripting, NGS command-line tools, and Python-based transcriptomic visualization.

The workflow includes:

- RNA-seq quality control
- Read alignment
- BAM processing
- Gene quantification
- Exploratory differential expression analysis
- Transcriptomic visualization

---

# Objective

The primary objective of this project was to:

- Process raw RNA-seq reads from public sequencing datasets
- Analyze transcriptomic differences between WT and H2B8 samples
- Identify highly upregulated and downregulated genes
- Generate publication-style visualizations for exploratory transcriptomic analysis

---

# Dataset Information

| Attribute | Details |
|-----------|---------|
| Organism | *Arabidopsis thaliana* |
| Experiment Type | RNA-seq |
| Sequencing Platform | Illumina |
| Read Type | Single-End |
| Experimental Condition | Drought Stress |
| Samples Used | WT and H2B8 |

### SRA Accessions

- SRR18297038  
- SRR18297042  

Raw sequencing data were obtained from the NCBI Sequence Read Archive (SRA).

---

# Tools & Technologies Used

| Tool | Purpose |
|------|---------|
| FastQC | RNA-seq quality control |
| HISAT2 | Read alignment |
| SAMtools | BAM conversion, sorting, indexing |
| featureCounts | Gene quantification |
| Python (Pandas, NumPy, Matplotlib, Seaborn) | Differential expression analysis & visualization |
| Bash | Workflow automation |
| Linux (WSL) | Computational environment |

---

# Workflow

```text
FASTQ
 ↓
FastQC
 ↓
HISAT2 Alignment
 ↓
SAMtools Processing
 ↓
featureCounts Quantification
 ↓
Exploratory Differential Expression Analysis (Python)
 ↓
Visualization (Python)
```

---

# Project Structure

```text
RNAseq-Arabidopsis-Analysis/
│
├── scripts/
│   ├── align_reads.sh
│   ├── feature_counts.sh
│   └── differential_expression.py
│
├── results/
│   ├── gene_counts.txt
│   ├── volcano_plot.png
│   ├── ma_plot.png
│   ├── heatmap.png
│   └── pca_plot.png
│
├── qc/
│   ├── FastQC_reports/
│   └── QC_screenshots/
│
├── Presentation/
│   └── RNA-Seq.pptx
│
└── README.md
```

---

# Quality Control Analysis

FastQC analysis was performed to evaluate the quality of raw RNA-seq reads before alignment.

### Key Observations

- High per-base sequencing quality (Q > 30 across most bases)
- Very low adapter contamination
- Consistent read length distribution (~76 bp)
- GC content showed moderate deviation from theoretical distribution, which is expected in transcriptomic datasets due to biological expression bias

### Conclusion

The sequencing reads were of sufficient quality for downstream RNA-seq analysis.

---

# Alignment Results

Read alignment was performed using HISAT2 against the *Arabidopsis thaliana* reference genome.

### Alignment Statistics

| Sample | Overall Alignment Rate |
|--------|------------------------|
| SRR18297038 | ~96.6% |
| SRR18297042 | ~96.4% |

The high alignment rate indicates:

- Strong sequencing quality
- Good compatibility with the reference genome
- Minimal contamination
- Reliable downstream transcriptomic analysis

---

# BAM Processing

SAMtools was used for:

- SAM → BAM conversion
- BAM sorting
- BAM indexing

Processed BAM files were then used for gene quantification.

---

# Gene Quantification

Gene-level read quantification was performed using featureCounts against the TAIR10 annotation.

### Quantification Summary

- Total Meta-features Analyzed: 32,833
- Successfully Assigned Reads: ~68%

The generated count matrix was imported into Python for exploratory transcriptomic analysis.

---

# Exploratory Differential Expression Analysis

Gene expression differences between WT and H2B8 samples were explored using log2 fold change analysis.

### Log2 Fold Change Formula

```text
log2((H2B8 + 1) / (WT + 1))
```

### Important Note

This project used one sample per condition for educational and exploratory purposes.

Therefore:

- Fold changes are exploratory
- Statistical significance testing (adjusted p-values/FDR) was not performed
- Proper differential expression inference requires biological replicates and tools such as DESeq2 or edgeR

---

# Visualizations

## 1. Volcano Plot

Visualized transcriptome-wide expression changes between WT and H2B8 samples.

---

## 2. MA Plot

Displayed fold-change distribution relative to average gene expression.

---

## 3. Heatmap

Visualized relative expression patterns across highly variable genes.

The heatmap demonstrates transcriptomic separation between WT and H2B8 samples.

---

## 4. PCA Plot

Principal Component Analysis showed distinct transcriptomic profiles between WT and H2B8 samples.

---

## 5. Gene-Level Expression Analysis

AT1G08170 showed strong upregulation in H2B8 samples, suggesting possible involvement in stress-responsive pathways.

---

# Key Learning Outcomes

This project provided practical experience in:

- Linux-based bioinformatics workflows
- Bash scripting for pipeline automation
- RNA-seq preprocessing and alignment
- Transcriptomic quantification
- Exploratory gene expression analysis using Python
- Scientific visualization in Python
- Interpretation of transcriptomic data

---

# Future Improvements

Potential future extensions of this project include:

- Addition of biological replicates
- DESeq2 statistical differential expression analysis
- GO enrichment analysis
- KEGG pathway analysis
- Advanced transcriptomic clustering
- Functional annotation of differentially expressed genes

---

# Technologies

```text
Linux | Bash | Python | RNA-seq | HISAT2 | SAMtools | featureCounts | Transcriptomics | NGS
```

---

# Author

Rahul Singh

Bioinformatics & Computational Biology Enthusiast

LinkedIn:
https://www.linkedin.com/in/rahul-kumar-singh-1796b5332/

Portfolio:
http://codebyrahul.in

---

# Acknowledgment

Public RNA-seq datasets used in this project were obtained from the NCBI Sequence Read Archive (SRA).
