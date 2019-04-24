 tryUI <- function(id) {
   ns <- NS(id)
   tags$div(class = "dash-selectbox",
            htmlOutput(ns("try"))
   )
 }

 try <- function(input, output, session) {
   ns <- session$ns
   print(session$userData$cn)
   output$try <- renderUI({
     tags$div("fd")
   })
 }


