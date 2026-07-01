library(TTR)

# stock data 
BA <- read.csv("data/raw/BA.csv")

# moving averages 
BA$SMA20 <- SMA(BA$BA.Adjusted, 20) # short term 
BA$SMA50 <- SMA(BA$BA.Adjusted, 50) # intermediate term
BA$SMA200 <- SMA(BA$BA.Adjusted, 200) # long term

# exponential moving average
BA$EMA12 <- EMA(BA$BA.Adjusted, 12)
BA$EMA26 <- EMA(BA$BA.Adjusted, 26) # popular EMA periods 12 day - and - 26 day for MACD 

# RSI
BA$RSI <- RSI(BA$BA.Adjusted)

# MACD
macd <- MACD(BA$BA.Adjusted)
BA$MACD <- macd[,1]
BA$Signal <- macd[,2]

# processed data
write.csv(
  BA,
  "data/processed/BA_features.csv",
  row.names = FALSE
)

# now automate for the rest of the symbols 
symbols <- c("GE","GRMN","AMZN","F")
# could theorhetically load in all stock and analyze

for (symbol in symbols){
  # read csv
  stock <- read.csv(paste0("data/raw/", symbol, ".csv"))
  
  
  # name of the adjusted price column
  adj_col <- paste0(symbol, ".Adjusted")
  
  # moving averages
  stock$SMA20  <- SMA(stock[[adj_col]], 20)
  stock$SMA50  <- SMA(stock[[adj_col]], 50)
  stock$SMA200 <- SMA(stock[[adj_col]], 200)
  
  # exponential moving averages
  stock$EMA12 <- EMA(stock[[adj_col]], 12)
  stock$EMA26 <- EMA(stock[[adj_col]], 26)
  
  # RSI
  stock$RSI <- RSI(stock[[adj_col]])
  
  # MACD
  macd <- MACD(stock[[adj_col]])
  stock$MACD <- macd[, 1]
  stock$Signal <- macd[, 2]
  
  # processed data
  write.csv(
    stock,
    paste0("data/processed/", symbol, "_features.csv"),
    row.names = FALSE
  )
  
}

