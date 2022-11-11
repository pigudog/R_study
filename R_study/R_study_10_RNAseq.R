rm(list = ls())  ## 魔幻操作，一键清空~
options(stringsAsFactors = F)

library(airway)
data(airway)
exprSet = assay(airway)
colnames(exprSet)
group_list = colData(airway)[,3]
exprSet = exprSet[apply(exprSet,1,function(x) sum(x>1) > 5),]
table(group_list)


exprSet[1:4,1:4]
boxplot(log(exprSet+1))
# +1是为了防止报错，不能放入0

## method1:DESeq2

