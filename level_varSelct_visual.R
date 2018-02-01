##level data visualization
# 백인, 흑인 - ST3_p119. data없어서 못 해봄
setwd("E:\github\dataAnal_R_basic")

install.packages("boot") #
library(boot)
??boot

#biz_08adult.data
adult <- read.csv("적당한걸로만들어.data"   
                  ,header= F, strip.white= T)
names(adult) <-
  c(
    "age",
    "workclass",
    "fnlwgt",
    "education",
    "education_num",
    "marital_status",
    "occupation",
    "relationship",
    "race",
    "sex",
    "capital_gain",
    "capital_loss",
    "hours_per_week",
    "native_country",
    "wage"
  )

install.packages("tibble")
library(tibble)

glimpse(adult)

set.seed(1601)
n <- nrow(adult)
idx <- 1:n

training_idx <- sample(idx, n *.60)
training <- adult[training_idx, ]

library(dplyr)
library(ggplot2)

training %>%
  filter(race %in% c('Black', 'White')) %>%
  ggplot(aes(age, fill= wage))+
  geom_density(alpha= .5)+
  ylim(0, 0.1)+
  facet_grid(race~ sex, scales= 'free_y')

ggsave("plots/임의사진명.png", width=5.5, height=4
       , units='in', dpi=600)