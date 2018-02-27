library(shinydashboard)
library(shinyjs)
library(tidyverse)

source("ui_scripts.R")
source("decision-tree/server.R")
source("neural-network/server.R")

ui <- dashboardPage(
  dashboardHeader(title = "Machine Learning App - chess", titleWidth = 300),
  dashboardSidebar(
    width = 300,
    useShinyjs(),
    sidebarMenu(id = "menu",
                menuItem("Modelos", tabName = "tab1", icon = icon("bookmark")),
                menuItem("Resultados", tabName = "tab2", icon = icon("bookmark"))
                
    )
  ),
  dashboardBody(
    
    tabItems(
      tabItem(tabName = "tab1",
              tab1()
      ),
      
      tabItem(tabName = "tab2",
              tab2()
      ),
      
      tabItem(tabName = "tab3",
              tab3()
      )
    )
  )
)


server <- shinyServer(function(input, output) {
  
  # plot tree
  output$treePlot <- renderDecisionTreePlot(input)
  # plot neural network
  output$neuralNetworkPlot <- renderNeuralNetworkPlot(input)
  
})

# Run the application 
shinyApp(ui = ui, server = server)

