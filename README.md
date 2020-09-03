# Shiny-migrations-europe-bubblechart

Application is deployed under link: (Edit: plot not rendering since June 2020 due to [this](https://github.com/jcheng5/googleCharts/issues/12) dependencies issue) <br />
https://james-smith-889.shinyapps.io/shiny-migrations-europe-bubblechart/


Running application in R/RStudio:
1) Install particular packages: "shiny" and "magrittr" if needed. <br />
2) Copy and run this code in R or RStudio: <br />

if (!require(devtools)) <br />
  install.packages("devtools")
devtools::install_github("jcheng5/googleCharts") <br />
library(shiny) <br />
library(magrittr) <br />
library(googleCharts) <br />
runGitHub( "Shiny-migrations-europe-bubblechart", "James-Smith-889") <br />
