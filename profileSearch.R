profileSearchUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
           tags$div(class = "search-container",
                    tags$p("Choose County"),
                    searchBoxUI(ns("Box")),
                    # # htmlOutput(ns("searchMap")),
                    actionButton(class = "searchBox-btn", 
                                 ns("searchBtn"), "Go")
           ),
           htmlOutput(ns("renderPage"))
  )
}


profileSearch <- function(input, output, session) {
  ns <- session$ns
  
  data <- read.csv(file = "CountyNameinMS.csv", header = TRUE)
  
  countyNameData <- as.list(data[["County"]])
  
  selectedCounty <- callModule(searchBox, "Box", countyNameData, "")
  
  selected <- reactiveValues(
    name = NULL
  )
  
  observe({
    selected$name <- selectedCounty$countyName
  })
  
  
  renderText
  # 
  # observeEvent(sB(), {
  #   output$renderPage <- renderUI({
  #     profilePageUI(ns("renderprofile"))
  #   })
  #   callModule(profilePage, "renderprofile")
  # })
  
  observeEvent(input$searchBtn, {
    session$userData$cn <- selected$name
    change_page("side")
  })
  
}

