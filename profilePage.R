profilePageUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(
    tags$div(class = "profilePage-border"),
    # tags$div(class = "profilePage-header",
    #          htmlOutput(ns("headerUI"))),
    tags$div(class = "tabPanel-profilePage",
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


profilePage <- function(input, output, session, countyName) {
  output$headerUI <- renderUI({
    countyName
  })
  
  callModule(pcPage, "tryPcPage")
  
  # callModule(submenu, "pc")

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

