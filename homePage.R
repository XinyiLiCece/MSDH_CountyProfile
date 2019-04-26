aboutPageUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "tabPanel-aboutPage",
           tabsetPanel(
             type = "tabs",
             # tabPanel("Population Characteristics", msdhIntroUI(ns("intro"))),
             tabPanel("Introduction of MSDH", htmlOutput(ns("msdhIntro"))),
             id = "tabPanel-side-aboutPage"
           ))
  
}

aboutPage <- function(input, output, session) {
  #callModule(msdhIntro, "intro")
  print("Before 1")
  output$msdhIntro <- renderUI({
    div(class = "msdhIntro",
        checked = NA,
        tags$div(
          class = "msdhIntro-p",
          tags$p(
            "The MSDH strives for excellence in government, cultural competence in the carrying out of our mission and to seek local solutions to local problems. Mississippi has an estimated total population of 2,984,100 residents in 2017. "
          ),

          tags$p( 
            "The state is predominantly rural and divided into 82 counties, with 65 considered to be rural. The racial composition is approximately 59.3% white, 37.7% black or African American and 3.0% characterized as other. "
          ),
          tags$p( 
            "Population health outcomes can be measured by premature death rates, or deaths of individuals before the age of 75, as these deaths may have occurred due to poor health outcomes."
            ),
          tags$p( 
           "As the poorest state in the nation, Mississippi faces greater challenges than many other states to prevent and combat illnesses. At the same time, there have been some significant public health successes: Mississippi is recognized as a national leader in childhood immunizations. Program development resources, such as the County Health Profiles, assist in statewide efforts to build a culture of health and improve Mississippi health status. This report can be used as a resource to assist in the planning for ongoing and new health programs throughout the state of Mississippi, as well as to inform the general public of their county health status. MSDH is administered at the level of public health regions. However, to be consistent with other surveillance reports, some of the indicators in the County Health Profiles are still presented by public health district."
           )
          ))
  })
  print("Before 2")
  }
