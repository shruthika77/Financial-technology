setwd("./R Quant1")
library(fPortfolio)
load("./RData/ef.RData")

par(mfrow = c(1,1))
plot(ef)

plot.new()
par(mfrow = c(1,1))
plot(ef)

pdf("./Report/test plots.pdf")
par(mfrow=c(1,1))
plot(ef,1)
dev.off()
dir.create("./Report", showWarnings = FALSE)
pdf("./Report/test plots.pdf")
# ... your plotting code here ...
dev.off()

install.packages("readx1")
library(readxl)
sp500monthly <- read.csv("./Data/SP500.csv")