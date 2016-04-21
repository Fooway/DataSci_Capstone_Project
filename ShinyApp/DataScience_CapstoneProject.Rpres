Word Prediction System of Capstone Project
========================================================
author: C. Ou
date: 2016-04-18

About Word Prediction System
========================================================

.  Main purpose is to build a shiny application that is able to predict the next word. 

.  More detailed about the App, please see:
[https://fooway.shinyapps.io/DataSci_Capstone_Project](https://fooway.shinyapps.io/DataSci_Capstone_Project)

.  The whole codes of this application can be found in this GitHub repo: [https://github.com/Fooway/DataSci_Capstone_Project.git](https://github.com/Fooway/DataSci_Capstone_Project.git)

.  Learn more about the Coursera Data Science Specialization: [https://www.coursera.org/specialization/jhudatascience/1](https://www.coursera.org/specialization/jhudatascience/1)



Usage of Word Prediction System
========================================================

Main Interface; More See **User Guide** and **About**.
![Application Screenshot](about/app-screenshot-userguide.png)

Simply input you words, and display the next words.



Database Design of SQLite
========================================================

.  Create a table called *NGrams* including five columns (*type*, *word*, *next*, *frequency* and *ngram*)

.  Store frequency dictionaries (from 2-Grams to 10-Grams) into **SQLite** database

.  Optimize the SQLite database to meet the requirements of both efficiency and accuracy

.  Compress **Full Version** database (**4.89GB**) into **Lite Version** database (**86.2MB**) which meets  free ShinyApps.io server requirements



Prediction of Stupid Backoff Method
========================================================

.  Aggregate term frequency matrices from 2-Grams to 10-Grams 

.  Transfer them into frequency dictionaries

.  Predict Word of N-Grams and Stupid Backoff method was proposed by Brants et al (2007)

.  Search the word frequency dictionary database from higher gram to lower gram

.  Stop if the matched words; Otherwise, back off to lower gram 
