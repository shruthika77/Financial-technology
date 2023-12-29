setwd("./R Quant1")
library(quantmod)
getSymbols(c("2498.TW"), from="2015-01-01", to="2019-12-31",
           periodicity="monthly", auto.assign = TRUE)
HTC <- "2498.TW"
getSymbols(c("GBP=X","AUD=X", EUR="X"), src = "yahoo", from="2015-01-01", to="2019-12-31")

tickers <- c("IVV","IDEV","IUSB","IEMG","IJH","IJR")
getSymbols(tickers, from="2015-01-01", to="2017-12-31",
           periodicity="daily")

plus.function <- function(x) (x+100)
plus.function(1)
get.adprice <- function(x) {Ad(get(x))}
IVV.adprice <- get.adprice("IVV")