setwd("./R Quant1")
#forcasting investment return with factor
#checking the values

load(file = "./RData/SP500.RData")
summary(SP500[c("annualReturn","dividendYield")])

summary(SP500$annualReturn[SP500$annualReturn > 0])
summary(SP500$annualReturn[SP500$annualReturn < 0])
#draw thw histogram

hist(SP500$annualReturn, main = "sp500 annual return histogram")

qqnorm(SP500$annualReturn,
       ylab = "sp500 annual return",
       xlab="normal score",
       main="sp500 annual return normal probability plot")

qqline(SP500$annualReturn)

#regression analysis

DY.lm <- lm(SP500$annualReturn[-1] ~ SP500$dividendYield[-dim(SP500)[1]])
DY.lm.summary <- summary(DY.lm)

names(DY.lm.summary)
DY.lm.summary$coefficients
DY.lm.summary$coefficients[2,]
data.frame(DY.lm.summary$coefficients[2,], DY.lm.summary$adj.r.squared)

DY.output <- data.frame(DY.lm.summary$coefficients[2,], DY.lm.summary$adj.r.squared))
DY.output
colnames(DY.output <- c("DY coefficient", "std.error","t-value","p-value", "adjrsquaredvalue"))
DY.output

save(SPF, file = "./RData/SPF,RData")
