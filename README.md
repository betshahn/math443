# Math 443X Introduction to Mathematical Finance
*applications of things we have been learning in class/ most of which come from Mathematics for Finance: An Introduction to
Financial Engineering by Marek Capinski and Tomasz Zastawniak*

## Portfolio Theory and CAPM 
#### (loosely based on Chapter 5 from the text)

Quick steps for the portfolio analysis: 
1. Collect Data: Download historical stock prices for 5–10 stocks.
2. Compute Returns: Calculate daily (or monthly) log returns from prices.
3. Compute Statistics: Calculate each stock’s mean return, variance, and the covariance matrix.
4. Minimum Variance Portfolio (MVP): Find weights that minimize portfolio variance.
5. Tangency Portfolio: Find weights that maximize Sharpe ratio using the risk-free rate. (not explicitly necessary)
6. CAPM Comparison: Calculate each stock’s beta and expected return based on CAPM.

*note that I chose a diverse mix of industries and risk profiles, which helps illustrate portfolio optimization and diversification: the stocks in question Boeing Co, Garmin, GE Aerospace, Amazon, and Ford*

Interpretation:
The portfolio analysis highlights the trade-off between risk and return. The Minimum Variance Portfolio (MVP) has the lowest risk (1.31% standard deviation per day) but also a lower expected return (0.12% daily), making it suitable for risk-averse investors. The Tangency Portfolio offers a higher expected return (0.31% daily) but with increased risk (2.18% standard deviation), achieving the highest Sharpe ratio (0.1375) and representing the best risk-adjusted return among the portfolios.

The CAPM comparison shows how each stock’s historical performance relates to market risk. Stocks with beta above 1 (BA, AMZN, F) are more volatile than the market, while GE is less sensitive. Comparing historical returns to CAPM expected returns reveals that GE outperformed its predicted return, while BA and F underperformed, highlighting which stocks added more or less to portfolio performance relative to their market risk.


