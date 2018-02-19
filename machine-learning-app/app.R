library(shinydashboard)
library(shinyjs)
library(tidyverse)

source("ui_scripts.R")

dados_treino = read_csv("data/dados_treino.csv")
dados_teste = read_csv("data/dados_teste.csv")

ui <- dashboardPage(
  dashboardHeader(title = "Machine Learning App - Política Brasileira", titleWidth = 400),
  dashboardSidebar(
    width = 400,
    useShinyjs(),
    sidebarMenu(id = "menu",
                menuItem("Previsão de resultado final", tabName = "tab1", icon = icon("bookmark")),
                menuItem("Previsão de investimento", tabName = "tab2", icon = icon("bookmark")),
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


server <- function(input, output) {
  
}

# Run the application 
shinyApp(ui = ui, server = server)

