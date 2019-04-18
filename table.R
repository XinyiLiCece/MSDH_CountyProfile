tablePlotUI <- function(id) {
  ns <- NS(id)
  tags$div(
    tags$div(class = "table-plot",
             plotlyOutput(ns("table_block")))
  )
}

tablePlot <- function(input, output, session, dataTB) {
  
  headerValues <- list()
  for (i in (0:ncol(dataTB))) {
    name <- names(dataTB)[i]
    headerValues[i] <- name
  }
  # headerValues <- append(headerValues, "<b>race</b>", after = 0)
  
  cellValues <- list()
  for (i in (0:ncol(dataTB))) {
    row <- dataTB[i]
    cellValues[i] <- row
  }
  
  output$table_block <- renderPlotly({
    p <- plot_ly(
      type = 'table',
      header = list(
        values = headerValues,
        align = c('left', rep('center', ncol(dataTB))),
        line = list(width = 1, color = 'rgb(255, 255, 255) transparent'),
        fill = list(color = 'rgb(211, 211, 211)'),
        font = list(
          family = "Arial",
          size = 14,
          color = "rgb(102, 102, 102)"
        )
      ),
      cells = list(
        values = cellValues,
        align = c('left', rep('center', ncol(dataTB))),
        line = list(color = array(c('rgb(255, 255, 255) transparent','rgb(255, 255, 255) transparent')), width = 1),
        fill = list(color = c(
          'rgb(255, 255, 255) transparent', 'rgb(255, 255, 255) transparent'
        )),
        font = list(
          family = "Arial",
          size = 14,
          color = c("#333333")
        )
      )
    )
    p = layout(p,
               paper_bgcolor="rgb(255, 255, 255) transparent"
    )
  })
}
