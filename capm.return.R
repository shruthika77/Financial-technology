setwd("./R Quant1")
library(quantmod)
#analyse market risk using capm

getSymbols(c("AAPL","^GSPC","^IRX"), from= "2010-01-01", to="2019-12-31",
           periodicity="monthly", auto.assign = TRUE)

capm.return <- merge(monthlyReturn(AAPL$AAPL.Adjusted),
                     monthlyReturn(GSPC$GSPC.Adjusted),
                     monthlyReturn(IRX$IRX.Adjusted))

colnames(capm.return) <- c("AAPL","^GSPC","^IRX")

#calculating risk premium

capm.return$AAPL.rp <- capm.return$AAPL - capm.return$`^IRX`

capm.return$GSPC.rp <- capm.return$X.GSPC -capm.return$X.IRX
plot.new()
plot(x=coredata(capm.return$AAPL.rp), y=coredata(capm.return$X.GSPC.rp),
     type = "p",
     main = "market vs apple risk premium",
     xlab="market",
     ylab="Apple")
#calculating beta

capm.lm <- lm(AAPL.rp ~ X.GSPC.rp, data = capm.return)
summary(capm.lm)

capm.beta <- cov(capm.return$AAPL.rp - capm.return$X.GSPC.rp, use = "complete.obs") / 
  var(capm.return$X.GSPC.rp)

plot(x=coredata(capm.return$AAPL.rp), y=coredata(capm.return$X.GSPC.rp),
     type = "p",
     main = "market vs apple risk premium",
     xlab="market",
     ylab="Apple")
     abline(capm.lm, col=2)
     
save(capm.return, file = "./RData/capm.return.RData")