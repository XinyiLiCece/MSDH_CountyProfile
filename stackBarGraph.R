stackBarGraphUI <- function(id) {
  ns <- NS(id)
  
  tags$div(class = "line-graph",
           plotlyOutput(ns("graph_block")),
           tags$div(class = "control-panel",
                    checkBoxUI(ns("checkbox")),
                    selectBoxUI(ns("selectbox"))
                    )
  )
}

stackBarGraph <- function(input, output, session, dataTB, filename, labelx, checkboxChoices) {
  ns <- session$ns

  # checkboxChoices <- as.list(colnames(dataTB[3:ncol(dataTB)]))

  # checkboxChoices <- as.list(c("Male", "Female"))

  checkedItems <- callModule(checkBox, "checkbox", checkboxChoices)
  
  checked <- reactiveValues(
    name = NULL
  )
  
  observe({
    checked$name <- checkedItems$items 
  })
  
  selectBoxChoices <- list("stack", "group")
  
  selectGraph <- callModule(selectBox, "selectbox", selectBoxChoices)
  
  graph <- reactiveValues(
    mode = NULL
  )
  
  observe({
    graph$mode <- selectGraph$items 
  })
  
  output$graph_block <- renderPlotly({
    x <- list(
      title = toString(labelx)
    )
    y <- list(
      title = "Count",
      tickformat = '0.0f'
    )

    p <- plot_ly(dataTB, x = as.character(dataTB[[labelx]])) %>%
      layout(xaxis = x, yaxis = y, width = '100%', height = '100%', barmode = graph$mode)
    p
    for (cn in checked$name) {
      p <- add_trace(p, y = dataTB[[cn]],
                     hoverinfo = "y",
                     name = cn)
    }
    p
  })
}