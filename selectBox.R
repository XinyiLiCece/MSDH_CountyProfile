selectBoxUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "dash-selectbox",
    htmlOutput(ns("selectbox"))
  )
}

selectBox <- function(input, output, session, selectBoxChoices) {
  ns <- session$ns

  output$selectbox <- renderUI({
    selectInput(ns("select"), "Choice graph type", 
                choices = selectBoxChoices, 
                # selected = "selectBoxChoices")
                selected = "stack")
  })
  
  returnSelected <- reactiveValues()
  
  observe({returnSelected$items <- input$select })
  print(returnSelected$items)
  return(returnSelected)
}


