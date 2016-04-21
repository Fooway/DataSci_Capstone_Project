################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                          by C. Ou   April 18, 2016                         ##
##                                                                            ##
##   Github Repo: https://github.com/Fooway/DataSci_Capstone_Project.git      ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################


#If you didn't install the following R packages, please install them first
#For testing purposes
#install.packages('shinythemes')
#install.packages('shiny')
#install.packages('markdown')
#install.packages('stylo')
##install.packages('tm')
##install.packages('stringr')


suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)))


shinyUI(navbarPage("Word Prediction System",                    
                   theme = shinytheme("united"),


                   
############################# ~~~~~~~~Tab 1~~~~~~~~ #############################
## Tab 1 - Word Prediction
tabPanel("Word Prediction",
         
         tags$head(includeScript("./js/ga-shinyapps-io.js")),
         
         fluidRow(
                 
                 column(6,    
                      
                      tags$div( textInput("text", 
                                          label = h3(strong("Input your text here:")),
                                          value = ) ,
                                tags$span(style="color:grey",("Only English words are supported.")),
                                br(),
                                tags$hr(),
                                h4("Suggested next word:"),
                                tags$span(style="color:darkred",
                                          tags$strong(tags$h3(textOutput("predictedWord")))),
                                br(),
                                tags$hr(),
                                h4("What you have input:"),
                                tags$em(tags$h4(textOutput("enteredWords"))),
                                align="center")                                
                       
                       
                        ),
                 column(4,
                        

                        tags$div(h3(strong("Top alternative words", align="center")),
                        tableOutput("suggestedwords"), align="center"),                     
                        br(),
                        br(),
                        br()                        
                       
                        
                        

                        ),   
                 column(2,
                        
                      
                        h3(strong('Settings')), 
                        sliderInput("ngram",strong('N-Grams'), min = 2, max = 10, value = 4, step = 1),                        
                        sliderInput("maxword",strong('Max Words'), min = 10, max =1000 , value = 10, step = 10),
                        radioButtons("type", "Word Type",
                                     c("All" = "all",
                                       "Blogs" = "blogs",
                                       "News" = "news",
                                       "Twitter" = "twitter"))
                       
                        
                        )
                 
         )
),

############################# ~~~~~~~~Tab 2~~~~~~~~ #############################
## Tab 2 - User Guide 
tabPanel("User Guide",
         fluidRow(
           column(2,
                  p("")),
           column(8,
                  includeMarkdown("./about/userguide.md")),
           column(2,
                  p(""))
         )
),


########################### ~~~~~~~~Tab 3~~~~~~~~ ###########################
## Tab 3 - About this Application
tabPanel("About",
         fluidRow(
                 column(2,
                        p("")),
                 column(8,
                        includeMarkdown("./about/about.md")),
                 column(2,
                        p(""))
         )
),

############################# ~~~~~~~~Footer~~~~~~~~ ##############################
## Footer
tags$hr(),
tags$br(),
tags$span(style="color:grey", 
          tags$footer(("All Right Reserved © 2016 - "), 
                      tags$a(
                              href="https://github.com/Fooway/DataSci_Capstone_Project.git",
                              target="_blank",
                              "   C. Ou."), 
                      tags$br(),
                      ("Powered by"), tags$a(
                              href="http://www.r-project.org/",
                              target="_blank",
                              "R"),
                      ("&"), tags$a(
                              href="http://shiny.rstudio.com",
                              target="_blank",
                              "Shiny"),
                       ("&"), tags$a(
                               href="http://www.rstudio.com/products/shiny/shiny-server",
                               target="_blank",
                               "Shiny Server."),                      
                      align = "center"),
          
          tags$br()
)
)#navbarPage
)#shinyUI
