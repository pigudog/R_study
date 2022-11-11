rm(list = ls())
options(stringsAsFactors = F)

# read file 
a = read.table('ensembl.txt')

# the way of select
strsplit(a$V1,'[.]')
strsplit(a$V1,'[.]')[[1]][1]

# library stringr
library('stringr')
a$ensembl_id = str_split(a$V1,'[.]',simplify = T)[,1]
class(str_split(a$V1,'[.]',simplify = T))

# org.Hs.eg.db 里有注释关系
library(org.Hs.eg.db)
g2s = toTable(org.Hs.egSYMBOL)  
g2e = toTable(org.Hs.egENSEMBL)  

b = merge(a,g2e,by='ensembl_id',all.x=T)
d = merge(b,g2s,by="gene_id",all.x = T)
# 等价于excel中的vlookup
# merge(x, y, by = intersect(names(x), names(y)),
# by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all,
# sort = TRUE, suffixes = c(".x",".y"),
# incomparables = NULL, ...)
# x,y 指两个要合并的数据集
# by用来连结这两个数据集的列，intersect指交集

order(d$V1)
d = d[order(d$V1),]

# Discard duplicate variables
table(table(d$ensembl_id)>1)
table(d$ensembl_id)[table(d$ensembl_id)>1]
d = d[!duplicated(d$V1),]
d = d[match(a$V1,d$V1),] # 找到另外元素在这边的顺序

rownames(d) = d$ensembl_id
d = d[,-2]
write.csv(d,"geneID2symbol.csv")
