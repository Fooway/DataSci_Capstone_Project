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
        library(stringr),
        library(markdown),
        library(stylo)))




dataCleaner<-function(text){
        
        cleanText <- tolower(text)
        cleanText <- removePunctuation(cleanText)
        cleanText <- removeNumbers(cleanText)
        cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
        cleanText <- stripWhitespace(cleanText)

        return(cleanText)
}

cleanInput <- function(text){
        
        textInput <- dataCleaner(text)
        textInput <- txt.to.words.ext(textInput, 
                                      language="English.all", 
                                      preserve.case = TRUE)
        
        return(textInput)
}
