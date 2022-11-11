rm(list=ls())
options(stringsAsFactors = F)

# bioconductor 的数据包
library(airway)
data(airway)
exprSet= assay(airway)

colnames(exprSet)
# [1] "SRR1039508" "SRR1039509" "SRR1039512" "SRR1039513" "SRR1039516"
# [6] "SRR1039517" "SRR1039520" "SRR1039521"

# 注释信息
group_list = colData(airway)[,3]
tmp = data.frame(g=group_list)
rownames(tmp) = colnames(exprSet)
pheatmap::pheatmap(cor(exprSet),annotation_col = tmp)

# 删除基因表达量合小于5
exprSet = exprSet[apply(exprSet,1,function(x) sum(x>1)>5),]
dim(exprSet) # 只剩两万个了

# 取log后，选取重要的
exprSet = log(edgeR::cpm(exprSet)+1)
exprSet = exprSet[names(sort(apply(exprSet,1,mad),decreasing = T)[1:50]),]

M = cor(log2(exprSet+1))
tmp = data.frame(g=group_list)
rownames(tmp) = colnames(M)
pheatmap::pheatmap(M,annotation_col=tmp,filename = 'cor.png')

library(pheatmap)
pheatmap(scale(cor(log2(exprSet+1))))

