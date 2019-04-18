sePageUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "scPage"
  #          tags$div(class = "sc-Page-graph-container",
  #          navBlockUI(ns("try4")),
  #          navBlockUI(ns("try5")),
  #          navBlockUI(ns("try6"))
           # )
           )
  }

sePage<- function(input, output, session, sectionName) {
  # dataHouseIncome <- read.csv(file = "MedianHouseIncome.csv", header = TRUE)
  # 
  # dataBelowPoverty <- read.csv(file = "PopulationBelowPovertyLevel.csv", header = TRUE)
  # 
  # dataUnemployed <- read.csv(file = "PopulationUnemployed.csv", header = TRUE)
  # 
  # filename4 <- "MedianHouseIncome"
  # 
  # filename5 <- "PopulationBelowPovertyLevel"
  # 
  # filename6 <- "UnemployedPopulationPercentage"
  # 
  # callModule(navBlock, "try4", dataHouseIncome, "3", filename4)
  # 
  # callModule(navBlock, "try5", dataBelowPoverty, "3", filename5)
  # 
  # callModule(navBlock, "try6", dataUnemployed, "3", filename6)
}

# The filename will be used as block title and download file name, so filename have to be a string which all words start with uppercase letter while no space between each words
