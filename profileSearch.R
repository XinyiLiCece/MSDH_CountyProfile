profileSearchUI <- function(id, inputText) {
  ns <- NS(id)
  tags$div(class = "tabPanel-profileSearch",
           tags$div(class = "search-container",
                    tags$p("Choose County"),
                    searchBoxUI(ns("Box")),
                    # # htmlOutput(ns("searchMap")),
                    actionButton(class = "searchBox-btn", 
                                 ns("searchBtn"), "Go")
           ),
           leafletOutput(ns("mymap"))
           # p(),
           # actionButton("recalc", "New points")
  )
}


profileSearch <- function(input, output, session) {
  ns <- session$ns
  
  data <- read.csv(file = "CountyNameinMS.csv", header = TRUE)
  
  countyNameData <- as.list(data[["County"]])
  
  selectedCounty <- callModule(searchBox, "Box", countyNameData, "")
  
  selected <- reactiveValues(
    name = NULL
  )
  
  observe({
    selected$name <- selectedCounty$countyName
  })
  
  # 
  # observeEvent(sB(), {
  #   output$renderPage <- renderUI({
  #     profilePageUI(ns("renderprofile"))
  #   })
  #   callModule(profilePage, "renderprofile")
  # })
  
  observeEvent(input$searchBtn, {
    session$userData$cn <- selected$name
    change_page("side")
  })
  
  # points <- eventReactive(input$recalc, {
  #   cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  # }, ignoreNULL = FALSE)
  # 
  # output$mymap <- renderLeaflet({
  #   leaflet() %>%
  #     addProviderTiles(providers$Stamen.TonerLite,
  #                      options = providerTileOptions(noWrap = TRUE)
  #     ) %>%
  #     addMarkers(data = points())
  # })
  
  mapStates = map("state", fill = TRUE, plot = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet(data = mapStates) %>% addTiles() %>%
      addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)
  })
}

