# groupBarGraphUI <- function(id) {
#   ns <- NS(id)
#   
#   tags$div(class = "line-graph",
#            plotlyOutput(ns("graph_block")),
#            checkBoxUI(ns("checkboxGroup"))
#   )
# }
# 
# groupBarGraph <- function(input, output, session, dataTB, filename) {
#   ns <- session$ns
#   
#   labelx <- colnames(dataTB[1])
#   # 
#   # labely <- as.list(colnames(dataTB[3:ncol(dataTB)]))
# 
#   checkboxChoices <- as.list(colnames(dataTB[3:ncol(dataTB)]))
#   
#   checkedItems <- callModule(checkBox, "checkboxGroup", checkboxChoices)
#   
#   checked <- reactiveValues(
#     name = NULL
#   )
#   
#   observe({
#     checked$name <- checkedItems$items 
#   })
#   
#   output$graph_block <- renderPlotly({
#     x <- list(
#       title = toString(labelx)
#     )
#     y <- list(
#       title = "Count",
#       tickformat = '0.0f'
#     )
# 
#     labelxToChar <- as.character(dataTB[[labelx]])
# 
#     p <- plot_ly(dataTB, x = labelxToChar) %>%
#       layout(xaxis = x, yaxis = y, width = '100%', height = '100%',  barmode = 'group')
#     p
#     for (cn in checked$name) {
#       p <- add_trace(p, y = dataTB[[cn]], type = 'bar', 
#                      # text=dataTB[[cn]],
#                      textposition = 'auto',
#                      hoverinfo = "y",
#                      name = cn)
#     }
#     p
#   })
# }

groupBarGraphUI <- function(id) {
  ns <- NS(id)
  
  tags$div(class = "line-graph",
           plotlyOutput(ns("graph_block"))
  )
}

groupBarGraph <- function(input, output, session, dataTB, filename) {
  ns <- session$ns
  
  labelx <- colnames(dataTB[1])
  
  labely <- colnames(dataTB[3:ncol(dataTB)])
  
  output$graph_block <- renderPlotly({
    x <- list(
      title = toString(labelx)
    )
    y <- list(
      title = "Count",
      tickformat = '0.0f'
    )
    
    labelxToChar <- as.character(dataTB[[labelx]])
    
    p <- plot_ly(dataTB, x = labelxToChar) %>%
      layout(yaxis = list(title = 'Count'), width = '100%', height = '100%',  barmode = 'group')
    p
    for (cn in labely) {
      p <- add_bars(p, y = dataTB[[cn]],
                    name = cn)
    }
    p
  })
}