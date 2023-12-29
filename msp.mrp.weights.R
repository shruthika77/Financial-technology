setwd("./R Quant1")
library(fPortfolio)
load("./RData/hist.return.ts.RData")

tangency.portfolio <- tangencyPortfolio(hist.return.ts)
msp <-maxratioPortfolio(hist.return.ts)
mvp <- minvariancePortfolio(hist.return.ts)
msp.weights <- getWeights(msp)
barplot(msp.weights, main="highest sharpe ratio", xlab="Assests", ylab="max ratio portfolio",
        col = cm.colors(ncol(hist.return.ts)))
spec <- portfolioSpec()
setTargetRisk(spec)<-`0.02
mrp <- maxreturnPortfolio(hist.return.ts)
mrp.weights <- getWeights(mrp)
barplot(mrp.weights, main="max return portfolio with 2% risk", xlab = 'Assets', ylab = 'max return', col = cm.colors(ncol(hist.return.ts)))

length(mrp.weights)
length(msp.weights)
msp.mrp.weights <- rbind(msp.weights, mrp.weights)
row.names(msp.mrp.weights) <- c('maxsharpratio','risk 2%')
write.csv(msp.mrp.weights, file = "./Data/msp.mrp.weights.csv")

