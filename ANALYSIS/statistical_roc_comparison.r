#install.packages("pROC")
library(pROC)
setwd("DATA/")
data<-read.table("campr3_vs_veltri.csv",sep = ",", header = TRUE)

rocobj1 <- plot.roc(data$Class, data$Campr3,
                    main="Statistical comparison",
                    percent=TRUE,
                    col="#1c61b6")
rocobj2 <- lines.roc(data$Class, data$Veltri, 
                     percent=TRUE, 
                     col="#008600")
testobj <- roc.test(rocobj1, rocobj2)
text(50, 50, labels=paste("p-value =", format.pval(testobj$p.value),"\n", "AUC(CAMPR3)= ", testobj$roc1$auc,"\n","AUC(Veltri)= ", testobj$roc2$auc), adj=c(0, .5))
legend("bottomright", legend=c("Campr3", "Veltri"), col=c("#1c61b6", "#008600"), lwd=2)
