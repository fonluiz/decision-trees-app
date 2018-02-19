#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Não esqueça de setar o working directory
library(shiny)
library(readr)
library(rpart)				  
library(rattle)					
library(rpart.plot)	

chess_data <- read_csv("./chess_data.csv")

createTree <- function(rpartControl) {
  formula <- as.formula(win_depth ~ .)
  tree <- rpart(formula,data=chess_data,control=rpartControl)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    output$treePlot <- renderPlot({

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
    
    
  
})
