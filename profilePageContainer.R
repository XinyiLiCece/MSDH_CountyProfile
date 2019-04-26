profilePageContainerUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(
    tags$div(class = "profileContainer",
             tags$div(class = "update-search",
                      # textOutput(ns("countyName")),
                      searchBoxUI(ns("sb")),
                      actionButton(class = "searchBox-btn", 
                                   ns("searchbtn"), "Change County")),
             profilePageUI(ns("pP")))
  )
}

profilePageContainer <- function(input, output, session) {
  ns <- session$ns
  
  # output$countyName <- renderText({
  #   session$userData$cn
  # })
  
  callModule(profilePage, "pP", session$userData$cn)
  
  data <- read.csv(file = "CountyNameinMS.csv", header = TRUE)
  
  countyNameData <- as.list(data[["County"]])
  
  selectedCounty <- callModule(searchBox, "sb", countyNameData, "")
  
  selected <- reactiveValues(
    name = NULL
  )
  
  observe({
    selected$name <- selectedCounty$countyName
  })
  
  observeEvent(input$searchbtn, {
    callModule(profilePage, "pP", selected$name)
  })
  
}

