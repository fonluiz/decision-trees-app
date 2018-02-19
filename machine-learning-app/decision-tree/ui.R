library(shiny)

positions = list("a1"=1, "a2"=2, "a3"=3, "a4"=4, "a5"=5, "a6"=6, "a7"=7, "a8"=8,
                 "b1"=9, "b2"=10, "b3"=11, "b4"=12, "b5"=13, "b6"=14, "b7"=15, "b8"=16,
                 "c1"=17, "c2"=18, "c3"=19, "c4"=20, "c5"=21, "c6"=22, "c7"=23, "c8"=24,
                 "d1"=25, "d2"=26, "d3"=27, "d4"=28, "d5"=29, "d6"=30, "d7"=31, "d8"=32,
                 "e1"=33, "e2"=34, "e3"=35, "e4"=36, "e5"=37, "e6"=38, "e7"=39, "e8"=40,
                 "f1"=41, "f2"=42, "f3"=43, "f4"=44, "f5"=45, "f6"=46, "f7"=47, "f8"=48,
                 "g1"=49, "g2"=50, "g3"=51, "g4"=52, "g5"=53, "g6"=54, "g7"=55, "g8"=56,
                 "h1"=57, "h2"=58, "h3"=59, "h4"=60, "h5"=61, "h6"=62, "h7"=63, "h8"=64)

tabContent = function() {
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
                  value = 0.005),
      
      selectInput("white_king",
                  label = h5("Casa do", tags$b("rei branco")), 
                  choices = positions, 
                  selected = 1),
      
      selectInput("white_hook",
                  label = h5("Casa da", tags$b("torre branca")), 
                  choices = positions, 
                  selected = 1),
      
      selectInput("black_king",
                  label = h5("Casa do", tags$b("rei preto")), 
                  choices = positions, 
                  selected = 1)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("treePlot")
    )
  )
}