setwd("C:/Users/Sudharshini/Documents/R Quant1")

SP500 <- read.csv(file = "./Data/SP500.csv")

SP500$annualReturn <- c(NaN,(SP500$SP500level[-1] - SP500$SP500level[-dim(SP500)[1]]) / SP500$SP500level[-dim(SP500)[1]])

par(mar = c(5,5,3,5))

plot(SP500$SP500level[-1], SP500$annualReturn[-1], type = "l", col = "blue", 
     main = "SP500 dividend yield & annual return", xlab = "year", ylab = "annualreturn")

par(new=True)

plot(SP500$dividendYield[-dim(SP500)[-1]], type = "l", col = "red", xaxt = "n", yaxt = "n", xlab = "", ylab = "", lty = 2)

plot(SP500$dividendYield[-length(SP500$dividendYield)], type = "l", col = "red", xaxt = "n", yaxt = "n", xlab = "", ylab = "", lty = 2)

axis(side = "4")
mtext("Dividendyeild", side = "4", line = "3")
legend("topleft", c("annual return", "dividend yield"),
       col = c("blue","red"), lty = c(1,2))

cor(SP500$annualReturn[-1], SP500$dividendYield[-dim(SP500)[1]])
cor(SP500$annualReturn[-1], SP500$Peratio[-dim(SP500)[1]])
cor(SP500$annualReturn[-1], SP500$ShillerPEratio[-dim(SP500)[1]])
cor(SP500$annualReturn[-1], SP500$ShillerPEratio[-dim(SP500)[1]])

save(SP500, file = "./RData/SP500.RData")