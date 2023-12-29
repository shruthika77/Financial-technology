#Please make your own global multi-asset allocation portfolio using ETFs. 
#Please try to include various asset classes such as developed market equity, emerging market equity, developed a market bond, emerging market bond, commodity, and others. 
#Please analyze the asset allocation results depending on the level of the portfolio risk. 


# Install and load necessary packages
install.packages(c("fPortfolio", "quantmod"))
library(fPortfolio)
library(quantmod)

# Define ETF tickers
tickers <- c("URTH", "EEM", "AGG", "EMB", "DBC", "VNQ")

# Define the start and end dates for historical data
start_date <- "2020-01-01"
end_date <- Sys.Date()

# Get historical data for ETFs using quantmod
getSymbols(tickers, from = start_date, to = end_date, adjust = TRUE)
prices <- do.call(merge, lapply(tickers, function(x) Cl(get(x))))

# Calculate returns
returns <- na.omit(Return.calculate(prices))

# Create a portfolio specification
portfolio_spec <- portfolio.spec(assets = tickers)

# Add constraints (weights sum to 1)
portfolio_spec <- add.constraint(portfolio_spec, type = "weight_sum", min_sum = 1, max_sum = 1)

# Set the target return and risk
target_return <- 0.001  # Adjust based on your target return
target_risk <- 0.02     # Adjust based on your risk tolerance

# Set the objective
portfolio_spec <- add.objective(portfolio_spec, type = "return", name = "mean", target = target_return)
portfolio_spec <- add.objective(portfolio_spec, type = "risk", name = "StdDev", target = target_risk)

# Optimize the portfolio
optimal_portfolio <- optimize.portfolio(returns, portfolio_spec)

# Display the optimized weights
print(optimal_portfolio)

# Calculate portfolio return and risk
portfolio_return <- sumWeights(optimal_portfolio) %*% colMeans(returns)
portfolio_risk <- sqrt(t(estimateRisk(optimal_portfolio, type = "StdDev")) %*% solve(t(cov(returns))) %*% estimateRisk(optimal_portfolio, type = "StdDev"))

# Display the portfolio characteristics
cat("Portfolio Return:", portfolio_return, "\n")
cat("Portfolio Risk:", portfolio_risk, "\n")


