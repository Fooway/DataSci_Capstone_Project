## Capstone Project of Coursera Data Science Specialization
### Word Prediction System
 
******
This application of Word Prediction System is the capstone project for the Coursera Data Science specialization held by professors of the Johns Hopkins University and in cooperation with SwiftKey. The detailed information regarding the capstone project, please see <https://www.coursera.org/learn/data-science-project>.

![Coursera Logo](./ShinyApp/about/logo-jhu.png)     ![SwiftKey Logo](./ShinyApp/about/swiftkey.png)


******

#### Objectives


The main goal of this capstone project is to build a shiny application that is able to predict the next word. 

This capstone project was divided into seven sub tasks like data cleansing, exploratory analysis, the creation of a predictive model and more.

The training data were downloaded the data from the link below which originally come from a corpus called [HC Corpora](http://www.corpora.heliohost.org/).

https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip

All text mining and natural language processing was done with the usage of a variety of well-known R packages. 

In order to achieve above-mentioned goals of the capstone project, the following two jobs must be submitted for evaluation:

* A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.
* A slide deck consisting of no more than 5 slides created with R Studio Presenter.


******

#### Methodology


After downloaded and created a data sample from the HC Corpora data, the samples of data (Blog, News and Twitter) were cleaned by conversion to lowercase, removing profanity words, punctuation, links, white space, numbers and all kinds of special characters.The text mining method was proposed by Feinerer et al (2008) and used the related R packages.

After data exploration, it was indicated that the N-Grams model and back off method was the most efficient approach for limited computing resources. The time and memory consuming is a great issue because of operating millions of data records. A free database called **SQLite** was adapted for improving the computing effiency. **SQLite** is the most widely deployed database engine in the world and can support as large as **140TB** storage.

The frequency dictionaries were created and stored in a **SQLite** database. And then, the word prediction was employed the N-Grams model and Stupid Backoff method.

1.Creation of frequency dictionaries

Those aggregated term frequency matrices from 2-Grams to 10-Grams have been transferred into frequency dictionaries.

2.Database Design of SQLite

The database of frequency dictionaries includes a table called *NGrams* which has five columns, namely, *type*, *word*, *next*, *frequency* and *ngram*. The **Full Version** database has **4.89GB** after creating **INDEX** while the free ShinyApps.io server only allows the maximum 100 MB space avaliable. Therefore, the **Lite Version** database (**86.2MB**) was created by removing tons of records from 5-Grams to 10-Grams. The total data records dramatically decleased from **53.04 millions** to **1.56 millions**. The running time is obviously not different after database optimization but it somewhat sacrifices the accuracy due to the limited space offer. 

3.Prediction Using N-Grams and Stupid Backoff
 
The word prediction of N-Grams and Stupid Backoff method was proposed by Brants et al (2007). Searching the word frequency dictionary database from higher gram to lower gram, if the matched words were found, and then stopped. Otherwise, it would multiply by alpha and back off to lower gram model. In this application, the independent backoffs were adapted and it meant that no alpha value was applied.
 

******
#### References and Further Resources

* Feinerer, Ingo and Hornik, Kurt and Meyer, David. Text mining infrastucture in R (2008). Journal of Statistical Software:[https://www.jstatsoft.org/article/view/v025i05](https://www.jstatsoft.org/article/view/v025i05)

* Brants, Thorsten and Popat, Ashok C. and Xu, Peng and Och, Franz Josef and Dean, Jeffrey (2007). Large Language Models in Machine Translation, Proceedings of the 2007 Joint Conference on Empirical Methods in Natural Language Processing and Computational Natural Language Learning (EMNLP-CoNLL): [http://www.aclweb.org/anthology/D/D07/D07-1090.pdf](http://www.aclweb.org/anthology/D/D07/D07-1090.pdf)

* CRAN Task View: Natural Language Processing:[https://cran.r-project.org/web/views/NaturalLanguageProcessing.html](https://cran.r-project.org/web/views/NaturalLanguageProcessing.html)

* Coursera course of Stanford University on NLPL:[https://www.coursera.org/course/nlp](https://www.coursera.org/course/nlp)

* SQLite Database: [https://www.sqlite.org/](https://www.sqlite.org/)

******
* The Word Prediction System is hosted on shinyapps.io: [https://fooway.shinyapps.io/DataSci_Capstone_Project](https://fooway.shinyapps.io/DataSci_Capstone_Project)


* The whole code of this application, as well as all the milestone report, related scripts, this presentation  etc. can be found in this GitHub repo: [https://github.com/Fooway/DataSci_Capstone_Project.git](https://github.com/Fooway/DataSci_Capstone_Project.git)

* This pitch deck is located here: [http://rpubs.com/Fooway/Coursera-Capstone-Project](http://rpubs.com/Fooway/DataSci_Capstone_Project)

* Learn more about the Coursera Data Science Specialization: [https://www.coursera.org/specialization/jhudatascience/1](https://www.coursera.org/specialization/jhudatascience/1)
