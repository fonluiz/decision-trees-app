library(shinydashboard)
library(shinyjs)
library(tidyverse)

source("ui_scripts.R")
source("decision-tree/server.R")

ui <- dashboardPage(
  dashboardHeader(title = "Machine Learning App - chess", titleWidth = 400),
  dashboardSidebar(
    width = 400,
    useShinyjs(),
    sidebarMenu(id = "menu",
                menuItem("Previsão com classificação", tabName = "tab1", icon = icon("bookmark")),
                menuItem("Previsão com regressão", tabName = "tab2", icon = icon("bookmark")),
                menuItem("Aplicação dos modelos", tabName = "tab3", icon = icon("bookmark"))
                
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
  
  output$treePlot <- renderDecisionTreePlot(input)
  
})

# Run the application 
shinyApp(ui = ui, server = server)

