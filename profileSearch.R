# This creates UI for each page.
page <- function(title, content) {
  div(
    titlePanel(title),
    p(content),
    uiOutput("power_of_input")
  )
}

# Part of both sample pages.
home_page <- page("Home page", "This is the home page!")
side_page <- page("Side page", "This is the side p age!")

home_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>square</strong> of input and pass result to <code>output$power_of_input</code>: "))
  })
}

side_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>cube</strong> of input and <strong>also</strong> pass result to <code>output$power_of_input</code>: "))
  })
}


 router <- make_router(
   route("home", home_page, home_server),
   route("side", side_page, side_server)
 )
 

 
profileSearchUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
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
    print("is home")
    print((is_page("home")))
    change_page("side")
  })

  # observeEvent(sB(), {
  #   output$renderPage <- renderUI({
  #     profilePageUI(ns("renderprofile"))
  #   })
  #   callModule(profilePage, "renderprofile", selected$name)
  # })
  
}

