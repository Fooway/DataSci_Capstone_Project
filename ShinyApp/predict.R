################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                          by C. Ou   April 18, 2016                         ##
##                                                                            ##
##   Github Repo: https://github.com/Fooway/DataSci_Capstone_Project.git      ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

# Predict, using N-Grams and Stupid Backoff
library(magrittr)
library(stringr)
library(RSQLite)
library(tm)

ngram_backoff <- function(raw, db, max, type,imaxword) {
  # Based on Brants et al 2007.
  # If n-gram found, then using it. If not, back off to lower gram model. 
  if(max >9) max=9
  if (max<1)  max=1
  
  # process sentence, don't remove stopwords
  sentence <- tolower(raw) %>%
    removePunctuation %>%
    removeNumbers %>%
    stripWhitespace %>%
    str_trim %>%
    strsplit(split=" ") %>%
    unlist
  ###############
  predicted <-'NA'  #"NA" means "Not Available".
 
  for (i in min(length(sentence), max):1) {
    gram <- paste(tail(sentence, i), collapse=" ")
    
    if(type=="blogs" || type=="news" || type== "twitter"){
     
        sql <- paste("SELECT next, frequency FROM NGrams WHERE ", 
                   "  ngram=", i + 1, 
                   " AND word='", paste(gram), "'",
                   " AND type='", paste(type), "'", " ORDER BY frequency desc LIMIT ", imaxword , sep="")      
   
    }else{
      sql <- paste("SELECT next, frequency FROM NGrams WHERE ", 
                   " ngram=", i + 1,
                   " AND word='", paste(gram), "'",
                   " ORDER BY frequency desc LIMIT ", imaxword , sep="")           
    }

    
    ####################################
    #print(sql)    ####For testing purpose
    res <- dbSendQuery(conn=db, sql)
    predicted <- dbFetch(res, n=-1)
    names(predicted) <- c("Word", "Frequency")   
    #print(predicted)   ####For testing purpose
    if (nrow(predicted) > 0) return(predicted)
  }
  
   return("NA")  #"NA" means "Not Available".

}