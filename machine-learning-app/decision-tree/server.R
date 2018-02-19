library(shiny)
library(readr)
library(rpart)				  
library(rattle)					
library(rpart.plot)	

chess_data <- read_csv("data/chess.csv")

createTree <- function(rpartControl) {
  formula <- as.formula(win_depth ~ .)
  tree <- rpart(formula,data=chess_data,control=rpartControl)
}

renderDecisionTreePlot <- function(input) {
  renderPlot({
    maxDepth = input$maxDepth
    cp = input$cp
    wkc = substr(input$white_king, 1, 1)
    wkr = substr(input$white_king, 2, 2)
    whc = substr(input$white_hook, 1, 1)
    whr = substr(input$white_hook, 2, 2)
    bkr = substr(input$black_king, 1, 1)
    bkr = substr(input$black_king, 2, 2)
    
    control <- rpart.control(maxdepth=maxDepth,
                             minsplit=20,
                             cp=cp)
    
    tree = createTree(control)
    prp(tree)
  })
}


