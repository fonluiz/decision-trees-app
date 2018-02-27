train_num <- read_csv("~/decision-trees-app/machine-learning-app/data/numeric/train.csv")
test_num <- read_csv("~/decision-trees-app/machine-learning-app/data/numeric/test.csv")

# Tranform data into numeric data only
test$wkc[test$wkc == "a"] <- 1
test$wkc[test$wkc == "b"] <- 2
test$wkc[test$wkc == "c"] <- 3
test$wkc[test$wkc == "d"] <- 4

test$whc[test$whc == "a"] <- 1
test$whc[test$whc == "b"] <- 2
test$whc[test$whc == "c"] <- 3
test$whc[test$whc == "d"] <- 4
test$whc[test$whc == "e"] <- 5
test$whc[test$whc == "f"] <- 6
test$whc[test$whc == "g"] <- 7
test$whc[test$whc == "h"] <- 8

test$bkc[test$bkc == "a"] <- 1
test$bkc[test$bkc == "b"] <- 2
test$bkc[test$bkc == "c"] <- 3
test$bkc[test$bkc == "d"] <- 4
test$bkc[test$bkc == "e"] <- 5
test$bkc[test$bkc == "f"] <- 6
test$bkc[test$bkc == "g"] <- 7
test$bkc[test$bkc == "h"] <- 8

test$win_depth[test$win_depth == "draw"] <- -1
test$win_depth[test$win_depth == "zero"] <- 0
test$win_depth[test$win_depth == "one"] <- 1
test$win_depth[test$win_depth == "two"] <- 2
test$win_depth[test$win_depth == "three"] <- 3
test$win_depth[test$win_depth == "four"] <- 4
test$win_depth[test$win_depth == "five"] <- 5
test$win_depth[test$win_depth == "six"] <- 6
test$win_depth[test$win_depth == "seven"] <- 7
test$win_depth[test$win_depth == "eight"] <- 8
test$win_depth[test$win_depth == "nine"] <- 9
test$win_depth[test$win_depth == "ten"] <- 10
test$win_depth[test$win_depth == "eleven"] <- 11
test$win_depth[test$win_depth == "twelve"] <- 12
test$win_depth[test$win_depth == "thirteen"] <- 13
test$win_depth[test$win_depth == "fourteen"] <- 14
test$win_depth[test$win_depth == "fifteen"] <- 15
test$win_depth[test$win_depth == "sixteen"] <- 16

write_csv(test, "test.csv")


## Scale data for neural network
max = apply(train_num , 2 , max)
min = apply(train_num, 2 , min)
scaled = as.data.frame(scale(train_num, center = min, scale = max - min))


## Fit neural network 
library(neuralnet)

# fit neural network
set.seed(24)
NN = neuralnet(win_depth ~ wkc+wkr+whc+whr+bkc+bkr, train_num, hidden = 3 , linear.output = T, stepmax=1e6)

# plot neural network
plot(NN)

saveRDS(NN, "neuralnetwork.rds")
x <- readRDS("neuralnetwork.rds")
plot(x)
