setwd("./R Quant1")

install.packages("quantmod")
installed.packages()
installed.packages()[,1]

if (("quantmod" %in% as.character(installed.packages()[,1]))) {
  install.packages("quantmod")
}
library(quantmod)

#import dataset directly from the web

getSymbols(c("QQQ"), from="2010-10-01",
           periodicity="monthly",auto.assign = TRUE)

head(QQQ)
is(QQQ)

getSymbols(c("IVV","IDEV","IUSB","IEMG","IAGG","IJH","IJR"),
          from="2010-01-01", to="2019-12-31", periodicity="daily")
IVV

index(IVV)
is(index(IVV))

#calculating daily return 
dailyReturn(IVV$IVV.Adjusted)

hist.return <- merge(dailyReturn(IVV$IVV.Adjusted),
                     dailyReturn(IDEV$IDEV.Adjusted),
                     dailyReturn(IUSB$IUSB.Adjusted),
                     dailyReturn(IEMG$IEMG.Adjusted),
                     dailyReturn(IAGG$IAGG.Adjusted),
                     dailyReturn(IJH$IJH.Adjusted),
                     dailyReturn(IJR$IJR.Adjusted))
colnames(hist.return) <- c("IVV","IDEV","IUSB","IEMG","IAGG","IJH","IJR")

#obtaining the covariance and standard deviation

hist.return.cov <- cov(hist.return, use = c("complete.obs"))
hist.return.cor <- cor(hist.return, use = c("complete.obs"))
hist.return.cor

sqrt(diag(hist.return.cov)) * sqrt(250)
#IDEV has highest squared value
sd(hist.return$IDEV, na.rm=TRUE) * sqrt(250)                     

save(hist.return, file = "./RData/hist.return.RData")