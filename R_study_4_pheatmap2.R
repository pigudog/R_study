rm(list = ls())
library(pheatmap)

a1 = rnorm(100)
a2 = rnorm(100)+2


# 合并
pheatmap(cbind(a1,a2))
pheatmap(cbind(a1,a2),cluster_cols = F)


dim(a1) = c(5,20)
dim(a2) = c(5,20)
b = cbind(a1,a2) # 先横向进行合并
b = as.data.frame(b) # 使其拥有列名，可以理解为变量名
names(b) = c(paste('a1',1:20,sep = '_'),paste('a2',1:20,sep = '_'))
pheatmap(b , cluster_cols = F)

pheatmap(cbind(a1,a2),show_rownames = F,show_rownames = F)
