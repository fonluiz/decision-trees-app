library(shinydashboard)
library(shinyjs)


tab1 = function() {
  basicPage(
    h3("Árvore de decisão x Regressão logística", align = "center"),
    br(),
    fluidRow(
      tabBox(width = 12,
        tabPanel("Árvore de decisão"),
        tabPanel("Regressão logística")
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