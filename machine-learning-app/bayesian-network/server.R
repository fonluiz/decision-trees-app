library(shiny)
library(readr)
library(devtools)
library(bnclassify)
library(caret)

set.seed(24)

train <- read_csv("data/numeric/train.csv") %>%
  lapply(as.factor) %>% as.data.frame()
test <- read_csv("data/numeric/test.csv") %>%
  lapply(as.factor) %>% as.data.frame()

nb <- nb('win_depth', train)
nb.lp <- lp(nb, train, smooth = 0.01)
accuracy_bayes <- cv(nb.lp, train, k=10)
pred <- predict(nb.lp, test)
confusionMatrix(pred, test$win_depth)

renderNeuralNetworkPlot <- function(input) {
  renderPlot({
    
    #neuralNet <- readRDS("neural-network/neuralnetwork-3layers.rds")
    
    #plot.nnet(neuralNet)
  })
}