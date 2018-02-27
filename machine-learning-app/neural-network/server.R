library(shiny)
library(readr)
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

set.seed(24)

train_num <- read_csv("data/numeric/train.csv")

renderNeuralNetworkPlot <- function(input) {
  renderPlot({
    
    neuralNet <- readRDS("neural-network/neuralnetwork-3layers.rds")
    
    plot.nnet(neuralNet)
  })
}