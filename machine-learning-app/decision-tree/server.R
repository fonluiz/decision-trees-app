library(shiny)
library(readr)
library(rpart)				  
library(rpart.plot)	

chess_data <- read_csv("data/original/chess.csv")

createTree <- function(rpartControl) {
  formula <- as.formula(win_depth ~ .)
  tree <- rpart(formula,data=chess_data,control=rpartControl)
}

renderDecisionTreePlot <- function(input) {
  renderPlot({
    maxDepth = input$maxDepth
    cp = input$cp
    
    control <- rpart.control(maxdepth=maxDepth,
                             minsplit=20,
                             cp=cp)
    
    tree = createTree(control)
    prp(tree)
  })
}


