library(quantmod)

symbols <- c("BA","GE","GRMN","AMZN","F")

getSymbols(symbols,
           src="yahoo",
           from="2020-01-01",
           to="2026-07-01")

# folder 
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

# saving each stock
for (symbol in symbols){
  stock_data <- get(symbol)
  
  df <- data.frame(
    Date = index(stock_data), coredata(stock_data)
  )
  write.csv(df, 
            file = paste0("data/raw", symbol, ".csv"),
            row.names = FALSE)
}

