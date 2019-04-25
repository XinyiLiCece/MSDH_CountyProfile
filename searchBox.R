searchBoxUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "profile-searchBox",
           htmlOutput(ns("searchBox"))
  )
}

searchBox <- function(input, output, session, data, label) {
  ns <- session$ns
  
  countyNameList <- as.list(data[["County"]])
  
  output$searchBox <- renderUI({
    selectInput(ns('selectCounty'),
                         label,
                         data,
                         multiple=FALSE, 
                         # selected = NULL, 
                         selectize=FALSE)
  })

  returnSelected <- reactiveValues()
  
  observe({ returnSelected$countyName <- input$selectCounty })
  
  return(returnSelected)
}