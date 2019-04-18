# lineGraphUI <- function(id) {
#   ns <- NS(id)
#   
#   tags$div(class = "line-graph",
#            plotlyOutput(ns("graph_block")),
#            htmlOutput(ns("checkbox"))
#   )
# }

# 
# lineGraph <- function(input, output, session, dataTB, filename) {
#   ns <- session$ns
#   
#   checkboxChoices <- as.list(colnames(dataTB[2:ncol(dataTB)]))
# 
#   output$checkbox <- renderUI({
#          checkboxGroupInput(ns("variabler"), "Choose age range:",
#            choices = checkboxChoices,
#            selected = checkboxChoices)
#   })
#   
#   headerR <- reactive({
#     return(input$variabler)
#   })
# 
#   output$graph_block <- renderPlotly({
#     x <- list(
#       title = "Year"
#     )
#     y <- list(
#       title = "Race",
#       tickformat = '0.0f'
#     )
#     
#     p <- plot_ly(dataTB, x = ~year) %>%
#       layout(xaxis = x, yaxis = y, x = 1, y = 1, width = '100%', height = '100%')
#     p
#     for (cn in headerR()) {
#       p <- add_lines(p, y = dataTB[[cn]],
#                      name = cn)
#     }
#     p
#   })
# }
lineGraphUI <- function(id) {
  ns <- NS(id)
  
  tags$div(class = "line-graph",
           plotlyOutput(ns("graph_block")),
           # checkBoxUI(ns("checkboxLine"))
           tags$div(class = "control-panel",
                    checkBoxUI(ns("checkboxLine"))
                    # selectBoxUI(ns("checkboxLine"))
           )
  )
}


lineGraph <- function(input, output, session, dataTB, filename) {
  ns <- session$ns
  
  checkboxChoices <- as.list(colnames(dataTB[2:ncol(dataTB)]))
  
  checkedItems <- callModule(checkBox, "checkboxLine", checkboxChoices)
  
  checked <- reactiveValues(
    name = NULL
  )
  
  observe({
    checked$name <- checkedItems$items 
  })
  
  p
  
  output$graph_block <- renderPlotly({
    x <- list(
      title = "Year"
    )
    y <- list(
      title = "Race",
      tickformat = '0.0f'
    )
    
    p <- plot_ly(dataTB, x = ~year) %>%
      layout(xaxis = x, yaxis = y, x = 1, y = 1, width = '100%', height = '100%')
    p
    for (cn in checked$name) {
      p <- add_lines(p, y = dataTB[[cn]],
                     name = cn)
    }
    p
  })
}

