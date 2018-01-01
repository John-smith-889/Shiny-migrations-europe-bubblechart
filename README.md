# Shiny-migrations-europe-bubblechart

Running application in R/RStudio. Install paryicular packages: "shiny" and "magritts" if needed. Copy and run this code in R or RStudio:


if (!require(devtools))
  install.packages("devtools")
  
devtools::install_github("jcheng5/googleCharts")

library(shiny)

library(magrittr)

library(googleCharts)

runGitHub( "Shiny-migrations-europe-bubblechart", "James-Smith-889")
