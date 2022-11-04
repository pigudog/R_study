rm(list = ls())
options(stringsAsFactors = F)

# read file 
a = read.table('BLCA_93663_50_50.csv',sep=',',header=T,
               fill=T)

dat = a
library(ggstatsplot)
ggbetweenstats(data = dat, 
               x = "Group", y= "Expression")


library(ggplot2)
library(survival)
library(survminer)
table(dat$Status)
dat$Status = ifelse(dat$Status == "Dead",1,0)
sfit <- survfit(Surv(Days,Status)~Group, data=dat)
sfit
summary(sfit)
ggsurvplot(sfit, conf.int=F, pval=TRUE)
ggsave("survival_ARHGAP1_in_LGG.png")
ggsurvplot(sfit,palette=c("#E78800","#2E9FDF"),
          risk.table=TRUE,Pval=TRUE,
          conf.int=TRUE,xlab="Time in months",
          ggtheme=theme_light(),
          ncensor.plot=TRUE)
ggsave("survival_ARHGAP1_in_LGG.png")