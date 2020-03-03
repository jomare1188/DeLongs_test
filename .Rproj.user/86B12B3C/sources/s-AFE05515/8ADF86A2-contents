#install.packages("pROC")
library(pROC)
library(ggplot2)
setwd("./../ANALYSIS/")
data<-read.table("campr3_vs_veltri.csv",sep = ",", header = TRUE)

png("./statistical_roc_comparison.png",res = 150 , width = 1200,height = 1200)
rocobj1 <- plot.roc(data$Class, data$Campr3,
                    main="Statistical comparison",
                    percent=TRUE,
                    col="#1c61b6")
rocobj2 <- lines.roc(data$Class, data$Veltri, 
                     percent=TRUE, 
                     col="#008600")
testobj <- roc.test(rocobj1, rocobj2)
text(50, 50, labels=paste("p-value =",format.pval(testobj$p.value),"\n","auc(campr3)= ", testobj$roc1$auc,"\n","auc(veltri)= ", testobj$roc2$auc), adj=c(0, .5))
legend("bottomright", legend=c("Campr3", "Veltri"), col=c("#1c61b6", "#008600"), lwd=2)
dev.off()



