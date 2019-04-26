# library(shiny)
# library(plotly)
# library(shiny.router)
# source('profilePage.R', local = TRUE)
# source('togglableBlock.R', local = TRUE)
# source('lineGraph.R', local = TRUE)
# source('table.R', local = TRUE)
# source('homePage.R', local = TRUE)
# source('msdh_intro.R', local = TRUE)
# source('submenu.R', local = TRUE)
# source('countyProfile.R', local = TRUE)
# source('profileSearch.R', local = TRUE)
# source('profilePageContainer.R', local = TRUE)
# source('profilePage-pc.R', local = TRUE)
# source('stackBarGraph.R', local = TRUE)
# source('groupBarGraph.R')
# source('searchBox.R', local = TRUE)
# source('checkBox.R', local = TRUE)
# source('selectBox.R', local = TRUE)
# source('try.R', local = TRUE)
# 
# # Define UI for random distribution app ----
# ui <- fluidPage(
#   # useShinyjs(),  # Set up shinyjs
#   tags$head(
#     tags$link(rel = "stylesheet", type = "text/css", href = "index.css")
#     # tags$script(src = "temp.js")
#   ),
#   
#   tags$div(class = "header", checked = NA, 
#            tags$div(class="title",
#                     tags$h1(""),
#                     actionButton("aboutBtn", "about")
#            )
#   ),
#   
#     # Main panel for displaying outputs ----
#     mainPanel(
#         tags$div(class = "main-tabPanel",
#                  tabsetPanel(type = "tabs",
#                              tabPanel("Home", htmlOutput("page1")),
#                              # tabPanel("Health Profile", htmlOutput("page2")),
#                              tabPanel("Find your county", htmlOutput("page2"))
#                  )),
#       width = 12
#     )
#   )
# 
# 
# 
# server <- function(input, output) {
#   dA <- read.csv(file = "RaceByYearTemplet.csv", header = TRUE)
#   output$datacb <- renderTable({
#     dA[c("year",input$variable), drop = FALSE]
#   }, rownames = TRUE)
# 
#   output$page1 <- renderUI({
#     div(
#       div(class = "page1", checked = NA, 
#         # child: images
#         tags$div(class="landing-block background-content", 
#           tags$img(src = "ms-profile.jpg", width = "100%")
#         ),
#         tags$div(class="landing-block foreground-content",
#           tags$h1("Promote and protect the health of Mississippi.")
#         )
#       ),
#       aboutPageUI("about")
#     )
#   })
#   
#   output$page2 <- renderUI({
#     countyProfileUI("countyProf")
#   })
# 
#   # output$page2 <- renderUI({
#   #   profileSearchUI("search")
#   # })
#   
#   callModule(aboutPage, "about")
#   
#   # callModule(profilePage, "hellohi")
#   # callModule(profileSearch, "search")
#   callModule(countyProfile, "countyProf")
#   
#   router(input, output)
# }
# 
# # Run the application 
# shinyApp(ui = ui, server = server)
# 


library(shiny)
library(plotly)
library(shiny.router)
source('profilePage.R', local = TRUE)
source('togglableBlock.R', local = TRUE)
source('lineGraph.R', local = TRUE)
source('table.R', local = TRUE)
source('homePage.R', local = TRUE)
source('msdh_intro.R', local = TRUE)
source('submenu.R', local = TRUE)
source('countyProfile.R', local = TRUE)
source('profileSearch.R', local = TRUE)
source('profilePageContainer.R', local = TRUE)
source('profilePage-pc.R', local = TRUE)
source('stackBarGraph.R', local = TRUE)
source('groupBarGraph.R')
source('searchBox.R', local = TRUE)
source('checkBox.R', local = TRUE)
source('selectBox.R', local = TRUE)
source('try.R', local = TRUE)

# Define UI for random distribution app ----
ui <- fluidPage(
  # useShinyjs(),  # Set up shinyjs
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "index.css")
    # tags$script(src = "temp.js")
  ),
  
  tags$div(class = "header", checked = NA, 
           tags$div(class="title",
                    tags$h1(""),
                    actionButton("aboutBtn", "about")
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

mainPage <- function(title) {
  div(
    h1(title),
    htmlOutput("pageMain")
  )
}

main_server <- function(input, output, session) {
  ns <- session$ns
  print("main server")
  output$pageMain <- renderUI({
    tags$div("fd")
    countyProfileUI(ns("countyProf"))
  })
  callModule(countyProfile, "countyProf")
}

# Both sample pages.
about_page <- abouPage("about")
main_page <- mainPage("main")

router <- make_router(
  route("main", main_page, main_server),
  route("about", about_page, about_server)
)

# Run the application 
shinyApp(ui = ui, server = server)

