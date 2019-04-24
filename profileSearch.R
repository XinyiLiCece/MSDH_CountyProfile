tryUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "dash-selectbox",
           htmlOutput(ns("try"))
  )
}

try <- function(input, output, session) {
  ns <- session$ns
  output$try <- renderUI({
    tags$div("fd")
  })
}

# This creates UI for each page.
homepage <- function(title, content) {
  div(
    titlePanel(title),
    p(content),
    uiOutput("power_of_input")
  )
}
sidepage <- function(title) {
  div(
    titlePanel(title),
    uiOutput("tryOut")
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
}

side_server <- function(input, output, session) {
  ns <- session$ns
  session$userData$cn <- "ams"
  # print(session$userData$cn)
  output$tryOut <- renderUI({
    tryUI(ns("hf"))
  })
  callModule(try, "hf")
}

 router <- make_router(
   route("home", home_page, home_server),
   route("side", side_page, side_server)
 )
 

 
profileSearchUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
           # tryUI(ns("tyh")),
           actionButton(ns("tryRouter"), "Try"
                        ),
           # router_ui(),
           tags$div(class = "search-container",
             searchBoxUI(ns("Box")),
             # # htmlOutput(ns("searchMap")),
             actionButton(ns("searchBtn"), "Go")
           ),
           htmlOutput(ns("renderPage")),
           router_ui()
  )
}


profileSearch <- function(input, output, session) {
  # callModule(try, "tyh")
  ns <- session$ns
  
  
  
  # router(input, output, session)
  
  data <- read.csv(file = "CountyNameinMS.csv", header = TRUE)
  
  countyNameData <- as.list(data[["County"]])
  
  selectedCounty <- callModule(searchBox, "Box", countyNameData)
  
  selected <- reactiveValues(
    name = NULL
  )
  
  observe({
    selected$name <- selectedCounty$countyName
  })
  
  # sB <- reactive({
  #   return(input$searchBtn)
  # })

  # sB <- reactive({
  #   return(input$searchBtn)
  # })
  # 
  observeEvent(input$tryRouter, {
    change_page("side")
  })

  # observeEvent(sB(), {
  #   output$renderPage <- renderUI({
  #     profilePageUI(ns("renderprofile"))
  #   })
  #   callModule(profilePage, "renderprofile", selected$name)
  # })
  
}
