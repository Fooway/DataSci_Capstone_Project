################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                          by C. Ou   April 18, 2016                         ##
##                                                                            ##
##   Github Repo: https://github.com/Fooway/DataSci_Capstone_Project.git      ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(RSQLite),
        library(data.table),        
        library(stringr),
        library(markdown),
        library(stylo)))

source("./inputCleaner.R")
source("./predict.R")


shinyServer(function(input, output) {
  
       #The full database has 4.89GB (including 10-Grams) while the free ShinyApps.io server only allows 
       # the maximum 100MB space. Therefore, the Lite version database (86.2 MB) was adapted.
       db <- dbConnect(SQLite(), dbname="./data/ooNGramLite.db")
       
       
       wordPrediction <- reactive({
              #input data
              m<-  as.numeric(input$ngram) - 1
              imaxword<- as.numeric(input$maxword)       
              type<- as.character(input$type)
              
              #Limit to 4-Grams
              if(m >3) m=3
              if (m<1)  m=1
              
              text <- input$text
              textInput <- cleanInput(text)
              wordCount <- length(textInput)                
              wordPrediction <-ngram_backoff(text, db , m, type,imaxword )  }) #using raw text
                
              
       #Output predicted word  
       output$predictedWord <- renderText({          
          out <-wordPrediction()    
          if(is.character(out)){          
            return(out)            
          }else
          {  
            dt  <- data.table(out)
            dt1 <- dt[,sum(Frequency),by=Word] 
            names(dt1) <- c("Word", "Frequency")
            dt2 <-  dt1[order(-rank(Frequency),Word)]        
            rm(dt)
            rm(dt1)              
            return(unlist(dt2)[1])   

         }})
      
         
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)     
       
        output$suggestedwords <- renderTable({          
          out1 <-wordPrediction()
          if(is.character(out1)){           
 
          }else
          {
            dt  <- data.table(out1)
            dt1 <- dt[,sum(Frequency),by=Word] 
            names(dt1) <- c("Word", "Frequency")            
            dt2 <-  dt1[order(-rank(Frequency),Word)]
                    
            rm(dt)
            rm(dt1)
            return(dt2)
          } 
          })   
       
})


