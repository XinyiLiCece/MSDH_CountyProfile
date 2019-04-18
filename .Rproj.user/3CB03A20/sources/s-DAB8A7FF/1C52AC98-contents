profileSearchUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
           tags$div(class = "search-container",
             searchBoxUI(ns("Box")),
             # # htmlOutput(ns("searchMap")),
             actionButton(ns("searchBtn"), "Go")
           ),
           htmlOutput(ns("renderPage"))
  )
}


profileSearch <- function(input, output, session) {
  ns <- session$ns
  
  data <- read.csv(file = "CountyNameinMS.csv", header = TRUE)
  
  countyNameData <- as.list(data[["County"]])
  
  selectedCounty <- callModule(searchBox, "Box", countyNameData)
  
  selected <- reactiveValues(
    name = NULL
  )
  
  observe({
    selected$name <- selectedCounty$countyName
  })
  
  sB <- reactive({
    return(input$searchBtn)
  })

  observeEvent(sB(), {
    output$renderPage <- renderUI({
      profilePageUI(ns("renderprofile"))
    })
    callModule(profilePage, "renderprofile", selected$name)
  })
}

