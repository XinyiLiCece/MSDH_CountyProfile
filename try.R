 tryUI <- function(id) {
   ns <- NS(id)
   tags$div(class = "dash-selectbox",
            htmlOutput(ns("try"))
   )
 }

 try <- function(input, output, session) {
   ns <- session$ns
   print(session$userData$cn)
   output$select <- renderUI({
     selectBoxUI(ns("sb"))
   })
   selectBoxChoice <- list("stack", "group")
   
   callModule(selectBox, "sb", selectBoxChoice)
 }


