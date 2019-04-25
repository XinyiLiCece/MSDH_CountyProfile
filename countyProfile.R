# This creates UI for each page.
homepage <- function(title, content) {
  div(
    titlePanel(title),
    p(content),
    htmlOutput("search")
  )
}
sidepage <- function(title) {
  div(
    titlePanel(title),
    htmlOutput("renderPage")
  )
}
# Part of both sample pages.
home_page <- homepage("Home page", "This is the home page!")
side_page <- sidepage("Side page")

home_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>square</strong> of input and pass result to <code>output$power_of_input</code>: "))
  })
  output$search <- renderUI({
    profileSearchUI("search")
  })
  callModule(profileSearch, "search")
}

side_server <- function(input, output, session) {
  ns <- session$ns
  session$userData$cn <- "check userDate"
  output$renderPage <- renderUI({
    profilePageUI(ns("renderprofile"))
  })
  callModule(profilePage, "renderprofile")
}

router <- make_router(
  route("home", home_page, home_server),
  route("side", side_page, side_server)
)



countyProfileUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "county-profile",
           actionButton(ns("tryRouter"), "Try1"),
           router_ui()
  )
}


countyProfile <- function(input, output, session) {
  # callModule(try, "tyh")
  ns <- session$ns
  
  observeEvent(input$tryRouter, {
    change_page("side")
  })
  
  # observeEvent(sB(), {
  #   output$renderPage <- renderUI({
  #     profilePageUI(ns("renderprofile"))
  #   })
  #   callModule(profilePage, "renderprofile")
  # })
  # 
}
