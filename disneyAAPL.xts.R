setwd("C:/Users/Sudharshini/Documents/R Quant1")
file_path <- "~/R Quant1/Data/F-F_Research_Data_Factors.CSV"
fama_french_data <- read.csv(file_path, sep = ";")
ffd <- table(fama_french_data)
install.packages("quantmod")
library(quantmod)

# Download Disney stock data
getSymbols("DIS", src = "yahoo", from = "2010-01-01", to = Sys.Date())
disney <- Ad(DIS)  # Adjusted close prices

# Download Apple stock data
getSymbols("AAPL", src = "yahoo", from = "2010-01-01", to = Sys.Date())
apple <- Ad(AAPL)  # Adjusted close prices
monthly_returns_disney <- monthlyReturn(disney, type = "log")
monthly_returns_apple <- monthlyReturn(apple, type = "log")
# Assuming you have Fama-French data loaded in 'fama_french_data'
merged_data_disney <- merge(monthly_returns_disney, fama_french_data, by = "Date")
merged_data_apple <- merge(monthly_returns_apple, fama_french_data, by = "Date")
# For Disney
model_disney <- lm(monthly_returns_disney ~ Mkt.RF + SMB + HML, data = merged_data_disney)

# For Apple
model_apple <- lm(monthly_returns_apple ~ Mkt.RF + SMB + HML, data = merged_data_apple)

summary(model_disney)
summary(model_apple)
