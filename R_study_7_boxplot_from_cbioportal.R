rm(list=ls())
options(stringsAsFactors = F)

# Ovarian Serous Cystadenocarcinoma(TCGA, Nature 2011)
# All complete tumors (316 samples)/1 Genes
# Gene set/ pathway is altered in 28 of queied samples

a = read.table('plot.txt',header = T,
               sep = "\t",fill = T)

colnames(a) = c('id','stage','gene','mut','alteration')
dat=a

library(ggstatsplot)
ggbetweenstats(data=dat,x=stage,y=gene)


# change method
# compute the analysis of variance
res.aov <-aov(gene~stage,data=dat)
summary(res.aov)
TukeyHSD(res.aov)