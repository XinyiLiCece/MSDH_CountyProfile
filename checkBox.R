checkBoxUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "dash-checkbox",
    htmlOutput(ns("checkbox"))
  )
}

checkBox <- function(input, output, session, checkBoxChoices) {
  ns <- session$ns
  
  output$checkbox <- renderUI({
    checkboxGroupInput(ns("checked"), "Choice items",
                       choices = checkBoxChoices,
                       selected = checkBoxChoices)
  })
  
  returnChecked <- reactiveValues()
  
  observe({returnChecked$items <- input$checked })
  
  return(returnChecked)
}


