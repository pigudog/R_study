rm(list = ls()) 
# ls()----显示当前已有的所有变量
# rm(list=ls()) —清空工作历史的所有变量
options()$repos
# 查看默认镜像源情况
options()$BioC_mirror

options(BioC_mirror="http://mirrors.tuna.tsinghua.edu.cn/bioconductor/")
options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))

# 再次查看
options()$repos
options()$BioC_mirror

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager") 
BiocManager::install(c("GSEABase","GSVA","clusterProfiler" ),ask = F,update = F)
BiocManager::install(c("GEOquery","limma","impute" ),ask = F,update = F)
BiocManager::install(c("org.Hs.eg.db","hgu133plus2.db" ),ask = F,update = F)

options()$repos
install.packages('WGCNA')
install.packages(c("FactoMineR", "factoextra"))
install.packages(c("ggplot2", "pheatmap","ggpubr"))
library("FactoMineR")
library("factoextra")

library(GSEABase)
library(GSVA)
library(clusterProfiler)
library(ggplot2)
library(ggpubr)
library(hgu133plus2.db)
library(limma)
library(org.Hs.eg.db)
library("pheatmap")
