# This creates UI for each page.
homepage <- function(title) {
  div(
    htmlOutput("search")
  )
}
sidepage <- function(title) {
  div(
    htmlOutput("renderPage")
  )
}
# Part of both sample pages.
home_page <- homepage("Home page")
side_page <- sidepage("Side page")

home_server <- function(input, output, session) {
  ns <- session$ns
  output$search <- renderUI({
    profileSearchUI(ns("ps"))
  })
  callModule(profileSearch, "ps")
}

side_server <- function(input, output, session) {
  ns <- session$ns
  # session$userData$cn <- "check userDate"
  output$renderPage <- renderUI({
    profilePageContainerUI(ns("renderprofile"))
  })
  callModule(profilePageContainer, "renderprofile")
}

router <- make_router(
  route("home", home_page, home_server),
  route("side", side_page, side_server)
)

countyProfileUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
           router_ui()
  )
}

countyProfile <- function(input, output, session) {
  ns <- session$ns
}
