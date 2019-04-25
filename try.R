 tryUI <- function(id) {
   ns <- NS(id)
   tags$div(class = "dash-selectbox",
            tags$h1("SIDE"),
            htmlOutput(ns("renderPage"))
   )
 }

 try <- function(input, output, session) {
   ns <- session$ns
   print(session$userData$cn)
   output$select <- renderUI({
     selectBoxUI(ns("sb"))
   })
   output$renderPage <- renderUI({
     profilePageUI(ns("renderprofile"))
   })
   callModule(profilePage, "renderprofile")
 }


