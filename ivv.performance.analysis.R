setwd("./R Quant1")


install.packages("PerformanceAnalytics")

library(PerformanceAnalytics)


load('./rdata/AdCloseReturns.RData')

table.AnnualizedReturns(AdCloseReturns, scale=252, Rf=0)
table.Drawdowns(AdCloseReturns$IVV)
table.Drawdowns(AdCloseReturns$IVV, top=10)
table.Stats(AdCloseReturns$IVV)

charts.PerformanceSummary(AdCloseReturns$IVV)
pdf("./Report/ivv.pdf")