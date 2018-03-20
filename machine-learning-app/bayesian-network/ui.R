library(shiny)

decisionTreeTab = function() {
  sidebarLayout(
    sidebarPanel(
      sliderInput("maxDepth",
                  div(h4("Profundidade máxima"),
                      h6("Define a profundidade máxima da árvore. A raiz conta como 0.")),
                  min = 1,
                  max = 30,
                  value = 15),
      
      sliderInput("cp",
                  div(h4("Parâmetro de complexidade (cp)"),
                      h6("Não é tentada qualquer divisão que não diminua a falta geral de ajuste por um fator de cp.")),
                  min = 0,
                  max = 0.01,
                  value = 0.005)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("treePlot")
    )
  )
}
