setwd("./R Quant1")
load(file = "./RData/FF.xts.RData")
load(file = "./RData/capm.return.RData")
library(quantmod)
colnames(FF.xts) <- c("Mkt.RF","SMB","HML","RF")
FF.xts.use <- FF.xts[index(FF.xts) >= min(index(capm.return)),]
#combining the table
factor.return <- merge(capm.return*100, FF.xts)
#Examining the relationship between the stock risk premium and factors
factor.model <- lm(AAPL ~ Mkt.RF + SMB + HML, data=factor.return)
summary(factor.model)

names(factor.model)
factor.exposure <- factor.model$coefficients[2:4]
idiosyncratic.risk <- sd(factor.model$residuals)
commonfactor.risk <- cov(factor.return[,c("Mkt.RF","SMB","HML")], use = "complete.obs")