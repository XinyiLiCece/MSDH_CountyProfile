profilePageUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(
    tags$div(class = "profilePage-border"),
    # tags$div(class = "profilePage-header",
    #          htmlOutput(ns("headerUI"))),
    tags$div(class = "tabPanel-profilePage",
             tags$div(class = "county-intro",
                      textOutput(ns("countyName")),
                      textOutput(ns("countyDescrip"))
             #          searchBoxUI(ns("sb"))
             ),
             tabsetPanel(type = "tabs",
                         # submenuUI(ns("pc")),
                         tabPanel("Population Characteristics",pcPageUI(ns("tryPcPage"))),
                         tabPanel("Health Outcome Indicators", textOutput(ns("y"))),
                         tabPanel("Select Chronic Conditions and Infections Disease", textOutput(ns("z"))),
                         tabPanel("Maternal and Child Health", textOutput(ns("z1"))),
                         tabPanel("Health Behaviors Indicators", textOutput(ns("z2"))),
                         id = "tabPanel-side-profilePage"
             )
    )
  )
}

profilePage <- function(input, output, session, countyname) {
  ns <- session$ns
  
  countyDescriptions <- read.csv(file = "countyDescription.csv", header = TRUE)

  
  countyNum <- which(countyDescriptions$CountyName == countyname)
  
  countyDes <- countyDescriptions[["CountyDescription"]]

  output$countyName <- renderText({
    countyname
  })
  
  output$countyDescrip <- renderText({
    as.character(countyDes[countyNum])
  })
  
  callModule(pcPage, "tryPcPage")

  output$y <- renderText({
    "y"
  })
  output$z <- renderText({
    "z"
  })
  output$z1 <- renderText({
    "z1"
  })
  output$z2 <- renderText({
    "z2"
  })
  output$a <- renderText({
    "a"
  })
  output$b <- renderText({
    "bcd"
  })
}

