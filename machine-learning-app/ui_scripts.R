library(shinydashboard)
library(shinyjs)

source("decision-tree/ui.R")
source("neural-network/ui.R")

tab1 = function() {
  basicPage(
    h3("Modelos", align = "center"),
    br(),
    fluidRow(
      tabBox(width = 12,
        tabPanel("Árvore de decisão", decisionTreeTab()),
        tabPanel("Regressão logística"),
        tabPanel("Rede neural", neuralNetworkTab())
      )
    )
  )
}

tab2 = function() {
  basicPage(
    h3("Modelos de regressão: Ridge x Lasso", align = "center"),
    br(),
    fluidRow(
      tabBox(width = 12,
        tabPanel("Ridge"),
        tabPanel("Lasso")
      )
    )
  ) 
}

tab3 = function() {
  basicPage(
    h3("Aplicação dos modelos em novas entradas", align = "center"),
    br(),
    fluidRow(
      
    )
  ) 
}