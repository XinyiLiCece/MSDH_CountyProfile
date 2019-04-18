msdhIntroUI <- function(id) {
  ns <- NS(id)
  tags$div(class = "tabPanel",
           htmlOutput(ns("intro"))
  )
  }

msdhIntro <- function(input, output, session) {
  output$intro <- renderUI({
    div(class = "msdhIntro", checked = NA, 
      tags$div(class="msdhIntro-p1", 
        tags$p("
          Welcome to the New York City Department of Health and Mental Hygiene.

               With an annual budget of $1.6 billion and more than 6,000 employees throughout the five boroughs, we're one of the largest public health agencies in the world. We're also one of the nation's oldest public health agencies, with more than 200 years of leadership in the field.
               
               Every day, we protect and promote the health of 8 million diverse New Yorkers. Our work is broad-ranging. You see us in the inspection grades of dining establishments, the licenses dogs wear, the low- to no-cost health clinics in your neighborhood, and the birth certificates for our littlest New Yorkers.
               
               We're also behind the scenes with our disease detectives, investigating suspicious clusters of illness. Our epidemiologists study the patterns, causes and effects of health and disease conditions in New York City neighborhoods. These studies shape policy decisions and the City's health agenda.
               
               The challenges we face are many. They range from obesity, diabetes and heart disease to HIV/AIDS, tobacco addiction, substance abuse and the threat of bioterrorism. We’re also working to address enduring gaps in health between white New Yorkers and communities of color. Structural racism is at the root of these health inequities, which is why the Department has made racial justice a priority.
               
               The New York City Health Department is tackling these issues with innovative policies and programs, and getting exceptional results.
               
               See the Health Department's Agency Organization Chart (PDF).           
        ")
      )
    )
  })
}