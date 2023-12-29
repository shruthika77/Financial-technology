getwd()
setwd("C:/Users/Sudharshini/Documents/R Quant1")
load(file = "C:/Users/Sudharshini/Documents/R Quant1/RData/dis.RData")
#calculating daily return

price.t1 <- dis$Adj.Close[-dim(dis)[1]]#exclude last index
price.t2 <- dis$Adj.Close[-1]#exclude first index
daily.return <- (price.t2 - price.t1)/price.t1

dim(dis)[1]
length(daily.return)

dis$daily.return <- c(NaN, daily.return)

dis$cumulative.return <- rep(NaN, dim(dis)[1])

for (i in 2:dim(dis)[1]) {
  dis$cumulative.return[i] <- prod(1+dis$daily.return[2:i])-1
}
plot(dis$cumulative.return[-1], main="Cumulative Return", Xlab="Date",ylab ="cumulative return")

plot(dis$date.format[-1], dis$cumulative.return[-1], main="Cumulative Return", Xlab="Date",ylab ="cumulative return")

(1+dis$cumulative.return[dim(dis)[1]])^(1/58)-1

dis2000 <- dis[dis$date.format >= as.Date("2000-01-01"), ]
head(dis2000)
tail(dis2000)

save(dis, file = "./RData/dis.RData")
