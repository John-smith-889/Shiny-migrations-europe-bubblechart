# installation of googleCharts package
if (!require(devtools))
  install.packages("devtools")
devtools::install_github("jcheng5/googleCharts")

library(shiny)
library(magrittr)
library(googleCharts)

data <- read.csv2("dane2.csv", header = TRUE, sep = ";", # directory changed to run from github # zmienic na data/dane2.csv i pozniej na github utworzyc tez taki folder i tam wrzucic
          dec = ",", fill = TRUE, comment.char = "")         

# setting proper data types

data$Region <- as.factor(data$Region)

data$Migrant.Stock<- as.numeric(data$Migrant.Stock)

data$Refugee.Stock<- as.numeric(data$Refugee.Stock)

data$Population<- as.numeric(data$Population)

data$Year<-as.numeric(data$Year)

# changing scale of population

data$Population<- data$Population*1000













