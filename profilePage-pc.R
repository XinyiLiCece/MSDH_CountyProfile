pcPageUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "pcPage",
           tags$div(class = "pc-Page-graph-container",
                    navBlockUI(ns("CP")),
                    navBlockUI(ns("PBG")),
                    navBlockUI(ns("PBR")),
                    navBlockUI(ns("MHI")),
                    navBlockUI(ns("PBPL")),
                    navBlockUI(ns("UPP"))
                    ),
           htmlOutput(ns("sidenav"))
           )
  }

pcPage<- function(input, output, session, sectionName) {
  dataCountyPopulation <- read.csv(file = "CountyPopulation.csv", header = TRUE)
  # print("pcPage")
  # print(dataCountyPopulation)
  dataPopulationByGender <- read.csv(file = "PopulationByGender.csv", header =TRUE)
  
  dataPopulationByRace <- read.csv(file = "PopulationByRace.csv", header = TRUE)
  
  dataHouseIncome <- read.csv(file = "MedianHouseIncome.csv", header = TRUE)
  
  dataBelowPoverty <- read.csv(file = "PopulationBelowPovertyLevel.csv", header = TRUE)
  
  dataUnemployed <- read.csv(file = "PopulationUnemployed.csv", header = TRUE)
  print("file")
  print(dataUnemployed)
  filename1 <- "CountyPopulation"
  
  filename2 <- "PopulationByGender"
  
  filename3 <- "PopulationByRace"
  
  filename4 <- "MedianHouseIncome"
  
  filename5 <- "PopulationBelowPovertyLevel"
  
  filename6 <- "UnemployedPopulationPercentage"

  checkboxPBG <- as.list(c("Male", "Female"))

  checkboxPBR <- as.list(c("Black", "White", "Other Races"))

  checkboxMHI <- as.list(c("County", "State", "Nation"))

  checkboxPBPL <- as.list(c("County", "State", "Nation"))

  checkboxUPP <- as.list(c("County", "State", "Nation"))


  callModule(navBlock, "CP", dataCountyPopulation, "1", filename1)

  callModule(navBlock, "PBG", dataPopulationByGender, "2", filename2, "Age", checkboxPBG)

  callModule(navBlock, "PBR", dataPopulationByRace, "2", filename3, "Age", checkboxPBR)

  callModule(navBlock, "MHI", dataHouseIncome, "2", filename4, "Year" , checkboxMHI)

  callModule(navBlock, "PBPL", dataBelowPoverty, "2", filename5, "Year", checkboxPBPL)

  callModule(navBlock, "UPP", dataUnemployed, "2", filename6, "Year", checkboxUPP)
  
  # callModule(navBlock, "CP", dataCountyPopulation, "1", filename1)
  # 
  # callModule(navBlock, "PBG", dataPopulationByGender, "2", filename2,checkboxPBG)
  # 
  # callModule(navBlock, "PBR", dataPopulationByRace, "2", filename3, checkboxPBR)
  # 
  # callModule(navBlock, "MHI", dataHouseIncome, "2", filename4, checkboxMHI)
  # 
  # callModule(navBlock, "PBPL", dataBelowPoverty, "2", filename5, checkboxPBPL)
  # 
  # callModule(navBlock, "UPP", dataUnemployed, "2", filename6, checkboxUPP)

  output$sidenav <- renderUI({
    tags$div(class = "profilePage-sidenav",
             id = "draggable-object",
             tags$a(href=navLink("CP"), navLabel(filename1)),
             tags$a(href=navLink("PBG"), navLabel(filename2)),
             tags$a(href=navLink("PBR"), navLabel(filename3)),
             tags$a(href=navLink("MHI"), navLabel(filename4)),
             tags$a(href=navLink("PBPL"), navLabel(filename5)),
             tags$a(href=navLink("UPP"), navLabel(filename6))
    )
  })
  
  navLink <- function(tabName) {
    return (paste("#", session$ns(tabName), sep=""))
  }
  
  navLabel <- function(tabName) {
    name <- gsub('([[:upper:]])', ' \\1', tabName) #split the filename on uppercase letters
    return(name)
  }
}




# The filename will be used as block title and download file name, so filename have to be a string which all words start with uppercase letter while no space between each words
