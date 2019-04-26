navBlockUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "dashboard-block",
    htmlOutput(ns("title")),
    htmlOutput(ns("tabsetPanelInBlock")),
    tags$div(
      class = "data-source",
      htmlOutput(ns("sourceInfo"))
    ),
    downloadButton(ns('downloadData'), 'Download Date'),
    id = id
  )
}

navBlock <- function(input, output, session, data, graphId, filename, labelx, checkChoices) {
  ns <- session$ns
  
  # render title,
  title <- gsub('([[:upper:]])', ' \\1', filename) #split the input filename on uppercase letters
  
  output$title <- renderUI({
    tags$h3(title)
  })
  
  # render graph
  if (graphId == 1) {
    output$tabsetPanelInBlock <- renderUI ({
      tags$div(class = "tabPanel-plotBlock",
               tabsetPanel(type = "tabs",
                           tabPanel("Graph", lineGraphUI(ns("line"))),
                           tabPanel("table", tablePlotUI(ns("table")))
               )
      )
    })
    callModule(lineGraph, "line",data, filename)
    
    callModule(tablePlot, "table", data)
  }
  else if (graphId == 2) {
    output$tabsetPanelInBlock <- renderUI ({
      tags$div(class = "tabPanel-plotBlock",
               tabsetPanel(type = "tabs",
                           tabPanel("Graph", stackBarGraphUI(ns("bar"))),
                           tabPanel("Table", tablePlotUI(ns("table")))
               )
      )
    })
    callModule(stackBarGraph, "bar",data, filename, labelx, checkChoices)
    
    callModule(tablePlot, "table", data)
  }
  else if (graphId == 3) {
    output$tabsetPanelInBlock <- renderUI ({
      tags$div(class = "tabPanel-plotBlock",
               tabsetPanel(type = "tabs",
                           tabPanel("Graph", groupBarGraphUI(ns("bar"))),
                           tabPanel("Table", tablePlotUI(ns("table")))
               )
      )
    })
    callModule(groupBarGraph, "bar",data, filename)
    
    callModule(tablePlot, "table", data)
  }
  
  output$sourceInfo <- renderUI({
    tags$div({
      class = "data-source"
      tags$p("Source: U.S. Census Bureau, American Community Survey")
    })
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(filename, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(data, file)
    }
  )
}


