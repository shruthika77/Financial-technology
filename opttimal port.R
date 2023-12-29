setwd("./R Quant1")
load(file = "./RData/AdCloseReturn.RData")
install.packages("fportfolio")
library(fPortfolio)

is.na(AdcloseReturn)
#finding the missing values by TRUE == 0
hist.return <- AdcloseReturn[rowSums(is.na(AdcloseReturn))==0, ]
hist.return.ts <- as.timeSeries(hist.return)
ef <- portfolioFrontier(hist.return.ts, constraints = "LongOnly")

par(mfrow=c(1,1))
plot(ef,1)

save(hist.return.ts, file = "./Rdata/hist.return.ts.RData")
save(ef, file = "./Rdata/ef.RData")