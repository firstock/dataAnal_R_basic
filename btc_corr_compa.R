#BTC »ó°ü°è
#https://youtu.be/I3-1RVwFP_k
getwd()
setwd("d:/myR")
btc <- read.csv("data/bitcoin_dataset.csv")
# install.packages("caret")
# install.packages("corrplot")
# install.packages("Hmisc")
# library(Hmisc)
# library(caret)
# library(corrplot)

# write.csv(mod, "data/result/bit_.csv")


mod_cap <- lm(btc_market_price~ btc_market_cap, data=btc)
summary(mod_cap)
# write.csv(mod_cap, "data/result_lm/bit_cap.csv")

mod_rate <- lm(btc_market_price~ btc_hash_rate, data=btc)
summary(mod_rate)
# write.csv(mod_rate, "data/result_lm/bit_rate.csv")

mod_difficulty <- lm(btc_market_price~ btc_difficulty, data=btc)
summary(mod_difficulty)
# write.csv(mod_difficulty, "data/result_lm/bit_difficulty.csv")

mod_revenue <- lm(btc_market_price~ btc_miners_revenue, data=btc)
summary(mod_revenue)
# write.csv(mod_revenue, "data/result_lm/bit_revenue.csv")

mod_fees <- lm(btc_market_price~ btc_transaction_fees, data=btc)
summary(mod_fees)
# write.csv(mod_fees, "data/result_lm/bit_fees.csv")

mod_total <- lm(btc_market_price~ btc_n_transactions_total, data=btc)
summary(mod_total)
# write.csv(mod_total, "data/result_lm/bit_total.csv")

mod_usd <- lm(btc_market_price~ btc_estimated_transaction_volume_usd, data=btc)
summary(mod_usd)
# write.csv(mod_usd, "data/result_lm/bit_usd.csv")