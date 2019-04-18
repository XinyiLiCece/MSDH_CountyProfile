submenuUI <- function(id) {
  ns <- NS(id)
  navbarMenu("Population Characteristics",
             # tabPanel("County Population Estimates",navBlockUI(ns("tryblock"))),
             # tabPanel("Demographics of County", textOutput(ns("p2"))),
             # tabPanel("Median Household Income", textOutput(ns("p3"))),
             # tabPanel("Poverty Level", textOutput(ns("p4"))),
             # tabPanel("Unemployments", textOutput(ns("p5"))),
             # tabPanel("Education Level", textOutput(ns("p6"))),
             # tabPanel("Uninsured", textOutput(ns("p7")))
             tabPanel("Population Characteristics",pcPageUI(ns("tryPcPage"))),
             tabPanel("Social and Economic Characteristics", sePageUI(ns("p2")))
             )
  }

submenu <- function(input, output, session) {
  callModule(pcPage, "tryPcPage")
  
  callModule(sePage, "p2")
  
  output$p3 <- renderText({
    "p3"
  })
  output$p4 <- renderText({
    "p4"
  })
  output$p5 <- renderText({
    "p5"
  })
  output$p6 <- renderText({
    "p5"
  })
  output$p7 <- renderText({
    "p5"
  })
}
