library("DBI")
library("rjson")
library("data.table")
library("plotly")
library("quantmod")

current_date <- as.numeric(Sys.time())
before_date <- trunc(current_date - 15 * 60) * 1000
current_date <- trunc(current_date) * 1000

url = paste0("https://api.hitbtc.com/api/3/public/candles/ETHBTC?period=M15")

print(url)

raw_data_json <- scan(url, "", sep="\n")
eth_list <- fromJSON(raw_data_json)

eth_dataframe <- as.data.frame(rbindlist(eth_list, fill = TRUE))

write.csv(eth_dataframe, "eth.csv", row.names=FALSE)

df <- data.frame(Date=index(eth_dataframe),coredata(eth_dataframe))

df <- tail(df, 10)


fig <- df %>% plot_ly(
  type="candlestick",
  x = ~Date,
  open = ~open, 
  close = ~close,
  high = ~max, 
  low = ~min
) 

fig <- fig %>% layout(title = "ETH Candles")

fig

con <- dbConnect(RSQLite::SQLite(), ":memory:") 
dbWriteTable(con, "tblEthereum", eth_dataframe)
dbReadTable(con, "tblEthereum") 
dbDisconnect(con)

