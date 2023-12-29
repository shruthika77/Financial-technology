setwd("./R Quant1")
library(fPortfolio)
load("./RData/ef.RData")

return.risk.frontier <- frontierPoints(ef)
colnames(return.risk.frontier)
annualized.risk.return.frontier <- data.frame(target.risk = return.risk.frontier[,"targetRisk"]*sqrt(250),
                                              target.return = return.risk.frontier[,"targetReturn"]*250)
riskfree <- rep(0,dim(annualized.risk.return.frontier)[1])
annualized.sharpe <- (annualized.risk.return.frontier$target.return - riskfree / annualized.risk.return.frontier$target.risk)

max.sharpe.return.risk <- annualized.risk.return.frontier[annualized.sharpe == max(annualized.sharpe),]
plot(annualized.risk.return.frontier$target.risk,annualized.sharpe, xlab="risk", ylab="sharpe ratio")
points(max.sharpe.return.risk[,1],max(annualized.sharpe),col="red")
weightsPlot(ef)
> weightedReturnsPlot(ef)
write.csv(annualized.risk.return.frontier,file = "frontier.csv")