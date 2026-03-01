library(quantmod)
library(PerformanceAnalytics)

# picking some randon stocks 
# left to right Boeing Co, Garmin, GE Aerospace, Amazon, and Ford
symbols <- c("BA", "GRMN", "GE", "AMZN", "F")

# pulling them from yahoo
getSymbols(symbols, src = "yahoo", from="2020-01-01", to="2025-01-01")

# looking at the graph 
chart_Series(c(BA, GRMN))

# take all the stock tickers I specified, get their closing prices, and 
# combine them into one table by date.
prices <- do.call(merge, lapply(symbols, function(x) Cl(get(x))))

# computing the returns
returns <- na.omit(Return.calculate(prices, method="log"))

# mean and covariance
mu <- colMeans(returns)
Sigma <- cov(returns)

# minimum variance portfolio
one <- rep(1, length(mu))
w_MVP <- solve(Sigma) %*% one / as.numeric(t(one) %*% solve(Sigma) %*% one)

# tangency portfolio
Rf <- 0.03/252 # daily risk-free rate
w_tangency <- solve(Sigma) %*% (mu - Rf*one) / as.numeric(t(one) %*% solve(Sigma) %*% (mu - Rf*one))

# portfolio returns & risks
r_MVP <- sum(w_MVP * mu)
sd_MVP <- sqrt(t(w_MVP) %*% Sigma %*% w_MVP)

r_tan <- sum(w_tangency * mu)
sd_tan <- sqrt(t(w_tangency) %*% Sigma %*% w_tangency)
sharpe_tan <- (r_tan - Rf) / sd_tan                  # Sharpe ratio


# CAPM beta and expected returns
R_m <- rowMeans(returns)  # approximate market return
beta <- cov(returns, R_m) / var(R_m)
E_CAPM <- Rf + beta * (mean(R_m) - Rf)

# summary tables
portfolio_summary <- data.frame(
  Portfolio = c("MVP", "Tangency"),
  Expected_Return = c(r_MVP, r_tan),
  Std_Dev = c(sd_MVP, sd_tan),
  Sharpe = c((r_MVP - Rf)/sd_MVP, sharpe_tan)
)

capm_table <- data.frame(
  Stock = colnames(returns),
  Historical_Mean = mu,
  Beta = beta,
  CAPM_Expected = E_CAPM
)

portfolio_summary
capm_table
