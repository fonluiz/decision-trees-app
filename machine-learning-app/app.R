library(shinydashboard)
library(shinyjs)

source("ui_scripts.R")

ui <- dashboardPage(
  dashboardHeader(title = "Machine Learning App"),
  dashboardSidebar(
    useShinyjs(),
    sidebarMenu(id = "menu",
                menuItem("Previsão de resultado final", tabName = "tab1", icon = icon("bookmark")),
                menuItem("Previsão de investimento", tabName = "tab2", icon = icon("bookmark"))
    )
  ),
  dashboardBody(
    
    tabItems(
      tabItem(tabName = "tab1",
              tab1()
      ),
      
      tabItem(tabName = "tab2",
              tab2()
      )
    )
  )
)


server <- function(input, output) {
  
}

# Run the application 
shinyApp(ui = ui, server = server)

