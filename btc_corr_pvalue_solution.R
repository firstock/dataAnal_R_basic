#BTC
#https://youtu.be/I3-1RVwFP_k
getwd()
setwd("D:/github/dataAnal_R_basic")
btc <- read.csv("data/bitcoin_dataset.csv")
# install.packages("caret")
# install.packages("corrplot")
# install.packages("FactoMineR")
library(caret)
library(corrplot)
library(FactoMineR)

names(btc)
plot(btc$Date, btc$btc_market_price)

mod <- lm(btc_market_price~ btc_market_cap, data=btc)
mod1 <- lm(btc_market_price~btc_estimated_transaction_volume_usd, data=btc)
summary(mod)
summary(mod1)


#01:52

############## ????????
btc_corr <- na.omit(btc)
head(btc_corr,1)
cor <- cor(round(btc[,2:12],digit=0))
# write.csv(cor, "data/bit_cor_1.csv")

corrplot(cor, method="number")
corrplot(cor, method="pie")
corrplot.mixed(cor,lower="number",upper="color")

str(btc)
length(btc)
names(btc)
head(btc,1)

data.frame(chr=apply(btc,2,nchar)[1,])

head(btc,1)


# summary(btc)
## PCA. ?ձ׷? ?׸?.FactoMineR ????
pc1 <- PCA(btc[,2:24], scale.unit= TRUE, ncp=23, graph=TRUE)


########### 2018-01-18 ???? 10:57 
getwd()
?corrplot.mixed
# windows(80,90)
# corrplot.mixed(cor, lower="namber", number="color")

# pvalue
install.packages("Hmisc")
library(Hmisc)

# error- data?? btc_trade_volume ???????? ??��!
# p
bit_cor_pvale <- rcorr(as.matrix(cor), type="pearson")
bit_cor_pvale$P
write.csv(bit_cor_pvale$P, "data/result/bit_cor_pvale.csv")
write.csv(bit_cor_pvale$r, "data/result/bit_cor_r.csv")
head(bit_cor_pvale)




######### lm()

#dependence variable: btc_market_price
#independet: btc_market_cap, btc_trade_volue, btc_n_orphaned_blocks
#btc_hash_rate, btc_difficulty

#lm(dependence????~independent??????��, data= BTC)

mod <- lm(btc_market_price~ btc_market_cap, data=BTC)
summary(mod)
# write.csv(mod, "data/result/bit_.csv")
plot(mod)


#intercept is 3.23, which means that when the total USD value of bit
#slope is 6.029. it tell us that we predict the average USD makr..
mod1 <- lm(btc_market_price~ btc_estimated_transaction_volume_usd, data=BTC )
summary(mod1)
plot(mod1)

btc[["btc_total_bitcoins"]]
# btc_inde <- c(btc_total_bitcoins, btc_market_cap, btc_trade_volume, btc_blocks_size, btc_avg_block_size, btc_n_orphaned_blocks, btc_n_transactions_per_block, btc_median_confirmation_time, btc_hash_rate, btc_difficulty, btc_miners_revenue, btc_transaction_fees, btc_cost_per_transaction_percent, btc_cost_per_transaction, btc_n_unique_addresses, btc_n_transactions, btc_n_transactions_total, btc_n_transactions_excluding_popular, btc_n_transactions_excluding_chains_longer_than_100, btc_output_volume, btc_estimated_transaction_volume, btc_estimated_transaction_volume_usd)
#error !
# for(x in btc[0,]){
#   print(x)
#   mod <- lm(btc_market_price~ x, data=btc )
#   write.csv(mod, "data/result/bit_"+x+".csv")
# }

# subset(btc, btc$)



###?????? Ȧ???ƿ?
set.seed(1)
train.index <- sample(1:nrow(btc), 0.70*nrow(btc), replace=FALSE)
train <- btc[train.index,]
test <- btc[-train.index,]


#RMSE
#training the model on train dataset and predicting on test
model_cap <- lm(btc_market_price~ btc_market_cap, train)
summary(model_cap)
p_cap <- predict(model_cap, test)
# head(p_cap)
error_cap <- p_cap- test[["btc_market_price"]]
# head(error_cap)
sqrt(mean(error_cap^2))
# plot(p_cap)
#best model for predicting the market price of bitcoin

model_rate <- lm(btc_market_price~ btc_hash_rate, train)
summary(model_rate)
p_rate <- predict(model_rate, test)
error_rate <- p_rate- test[["btc_hash_rate"]]
sqrt(mean(error_rate^2))
#plot(p_rate)

model_difficulty <- lm(btc_market_price~ btc_difficulty, train)
summary(model_difficulty)
p_difficulty <- predict(model_difficulty, test)
error_difficulty <- p_difficulty- test[["btc_difficulty"]]
sqrt(mean(error_difficulty^2))
#plot(p_difficulty)

model_revenue <- lm(btc_market_price~ btc_miners_revenue, train)
summary(model_revenue)
p_revenue <- predict(model_revenue, test)
error_revenue <- p_revenue- test[["btc_miners_revenue"]]
sqrt(mean(error_revenue^2))
#plot(p_revenue)

model_fees <- lm(btc_market_price~ btc_transaction_fees, train)
summary(model_fees)
p_fees <- predict(model_fees, test)
error_fees <- p_fees- test[["btc_transaction_fees"]]
sqrt(mean(error_fees^2))
#plot(p_fees)

model_total <- lm(btc_market_price~ btc_n_transactions_total, train)
summary(model_total)
p_total <- predict(model_total, test)
error_total <- p_total- test[["btc_n_transactions_total"]]
sqrt(mean(error_total^2))
#plot(p_total)

model_usd <- lm(btc_market_price~ btc_estimated_transaction_volume_usd, train)
summary(model_usd)
p_usd <- predict(model_usd, test)
error_usd <- p_usd- test[["btc_estimated_transaction_volume_usd"]]
sqrt(mean(error_usd^2))
#plot(p_usd)

model_cap
model_rate
model_difficulty
model_revenue
model_fees
model_total
model_usd


# #?? ?ʳ?
# # data hold out
# set.seed(1)
# train.index <- sample(1:nrow(btc),0.70*nrow(btc), replace=FALSE)
# train <- btc[train.index,]
# test <- btc[-train.index,]
# plot(p1)
# 
# #training
# model1 <- lm(btc_market_price~ btc_trade_volume, train)
# summary(model1)
# p1 <- predict(model1, test)
# head(p1)
# 
# error1 <- p1- test[["btc_market_price"]]; error1
# sqrt(mean(error1^2))  #NA
# plot(p1)
# 
# model2 <- lm(btc_market_price~ btc_market_cap, train)
# summary(model2)
# 
# p2 <- predict(model2, test)
# head(p2)
# 
# error2 <- p2- test[["btc_market_price"]]
# sqrt(mean(error2^2))
# plot(p2)