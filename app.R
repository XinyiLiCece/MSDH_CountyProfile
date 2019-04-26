library(shiny)
library(plotly)
library(leaflet)
library(maps)
library(shiny.router)
source('profilePage.R', local = TRUE)
source('togglableBlock.R', local = TRUE)
source('lineGraph.R', local = TRUE)
source('table.R', local = TRUE)
source('homePage.R', local = TRUE)
source('msdh_intro.R', local = TRUE)
source('submenu.R', local = TRUE)
source('profileSearch.R', local = TRUE)
source('profilePageContainer.R', local = TRUE)
source('profilePage-pc.R', local = TRUE)
source('stackBarGraph.R', local = TRUE)
source('groupBarGraph.R')
source('searchBox.R', local = TRUE)
source('checkBox.R', local = TRUE)
source('selectBox.R', local = TRUE)
source('try.R', local = TRUE)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

# Define UI for random distribution app ----
ui <- fluidPage(
  # useShinyjs(),  # Set up shinyjs
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "index.css")
    # tags$script(src = "temp.js")
  ),
  
  tags$div(class = "header", checked = NA, 
           tags$div(class="page-router",
                    tags$h1(""),
                    actionButton("homeBtn", "Home"),
                    actionButton("aboutBtn", "About")
           )
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    router_ui(),
    width = 12
  )
)



server <- function(input, output) {
  dA <- read.csv(file = "RaceByYearTemplet.csv", header = TRUE)
  
  output$datacb <- renderTable({
    dA[c("year",input$variable), drop = FALSE]
  }, rownames = TRUE)
  
  observeEvent(input$homeBtn, {
    change_page("home")
  })
  
  observeEvent(input$aboutBtn, {
    change_page("about")
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
  
  router(input, output)
}

abouPage <- function(title) {
  div(
    htmlOutput("pageAbout")
  )
}

about_server <- function(input, output, session) {
  ns <- session$ns
  output$pageAbout <- renderUI({
    div(
      div(class = "page1", checked = NA, 
          # child: images
          tags$div(class="landing-block background-content", 
                   tags$img(src = "ms-profile.jpg", width = "100%")
          ),
          tags$div(class="landing-block foreground-content",
                   tags$h1("Promote and protect the health of Mississippi.")
          )
      ),
      aboutPageUI(ns("about"))
    )
  })
  callModule(aboutPage, "about")
  }

homepage <- function(title) {
  div(
    htmlOutput("search")
  )
}

home_server <- function(input, output, session) {
  ns <- session$ns
  output$search <- renderUI({
    profileSearchUI(ns("ps"))
  })
  callModule(profileSearch, "ps")
}

  sidepage <- function(title) {
    div(
      htmlOutput("renderPage")
    )
}

side_server <- function(input, output, session) {
  ns <- session$ns
  # session$userData$cn <- "check userDate"
  output$renderPage <- renderUI({
    class = "page2"
    profilePageContainerUI(ns("renderprofile"))
  })
  callModule(profilePageContainer, "renderprofile")
}

# Both sample pages.
about_page <- abouPage("about")
home_page <- homepage("Home page")
side_page <- sidepage("Side page")

router <- make_router(
  route("home", home_page, home_server),
  route("about", about_page, about_server),
  route("side", side_page, side_server)
)

# Run the application 
shinyApp(ui = ui, server = server)

