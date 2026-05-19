# Load required libraries
library(ggplot2)
library(pheatmap)

# -----------------------------
# Read Gene Count Data
# -----------------------------
counts <- read.table(
  "\\\\wsl.localhost\\Ubuntu\\home\\godfather\\Downloads\\Unix\\rnaseq_project\\results\\gene_counts.txt",
  header = TRUE,
  sep = "\t",
  comment.char = "#"
)

# View first few rows
head(counts)

# -----------------------------
# Extract Count Matrix
# -----------------------------
countdata <- counts[, 7:ncol(counts)]

# Rename columns
colnames(countdata) <- c("WT", "H2B8")

# Store gene names
genes <- counts$Geneid

# -----------------------------
# Calculate Log2 Fold Change
# -----------------------------
log2FC <- log2((countdata$H2B8 + 1) / (countdata$WT + 1))

# Create Results DataFrame
results <- data.frame(
  Gene = genes,
  WT = countdata$WT,
  H2B8 = countdata$H2B8,
  log2FoldChange = log2FC
)

# -----------------------------
# Top Upregulated Genes
# -----------------------------
head(results[order(-results$log2FoldChange), ])

# -----------------------------
# Top Downregulated Genes
# -----------------------------
head(results[order(results$log2FoldChange), ])

# -----------------------------
# PCA Analysis
# -----------------------------
# Log-transform counts
pca_data <- t(log2(countdata + 1))

# Remove genes with zero variance
pca_data <- pca_data[, apply(pca_data, 2, var) != 0]

# Perform PCA
pca <- prcomp(pca_data, scale. = TRUE)

# Create PCA dataframe
pca_df <- data.frame(
  PC1 = pca$x[, 1],
  PC2 = pca$x[, 2],
  Sample = rownames(pca$x)
)

# PCA Plot
ggplot(pca_df, aes(x = PC1, y = PC2, label = Sample)) +
  geom_point(size = 5) +
  geom_text(vjust = -1) +
  theme_minimal() +
  ggtitle("PCA of RNA-seq Samples")

# -----------------------------
# MA Plot
# -----------------------------
results$averageExpression <- (
  log2(results$WT + 1) +
    log2(results$H2B8 + 1)
) / 2

ggplot(
  results,
  aes(
    x = averageExpression,
    y = log2FoldChange
  )
) +
  geom_point(alpha = 0.4) +
  theme_minimal() +
  xlab("Average Expression") +
  ylab("Log2 Fold Change") +
  ggtitle("MA Plot")

# -----------------------------
# Expression Plot for a Single Gene
# -----------------------------
gene <- results[results$Gene == "AT1G08170", ]

barplot(
  c(gene$WT, gene$H2B8),
  names.arg = c("WT", "H2B8"),
  main = "Expression of AT1G08170",
  ylab = "Read Counts"
)

topgenes <- head(results[order(-abs(results$log2FoldChange)), ], 20)
heatmap_data <- countdata[results$Gene %in% topgenes$Gene, ]
rownames(heatmap_data) <- topgenes$Gene

pheatmap(
log2(heatmap_data + 1),
cluster_rows=TRUE,
cluster_cols=TRUE,
main="Top Differentially Expressed Genes"
)
