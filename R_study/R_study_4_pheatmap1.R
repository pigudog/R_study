rm(list = ls())
options(stringsAsFactors = F)

a = read.csv("SraRunTable.csv")
sort(a$MBases,decreasing=T)[1]
max(a$MBases)
min(a$MBases)
fivenum(a$MBases)

# boxplot
boxplot(a$MBases~a$Assay_Type)

# grab rna
table(a$Assay_Type)
rna = a[a$Assay_Type == "RNA-Seq",]
# mean(rna$MBases)
# colMeans(rna[,c(2,3)])
for (i in 1:nrow(head(b))){
  print(mean(as.numeric(b[i,])))
}
# as.numeric(rna)

# apply function
# x = as.numeric(b[i,])
# 1代表axis=1
apply(head(b),1,function(x){
  max(x)
})

# define function rowMax
rowMax = function(x){
  apply(x,1,max)
}
rowMax(head(b))

yang <- function(x){
  for (i in 1:nrow(x)){
    x = as.numeric(b[i,])
    y = x[1]+x[2]-x[3]
    print(y)
  }
}
yang(head(b))

# MBase是数据量的大小，可能我们会舍去小于5000,小于50这里
b = a[a$MBase > 50,]

# variance and standard deviation
# Like var this uses denominator n−1 
sd_f = sd(c(1,2,3))^2
sort(apply(b,1,sd),decreasing = T)[1:10]
cg = names(sort(apply(b,1,sd),decreasing = T)[1:10])
pheatmap::pheatmap(b[1])
