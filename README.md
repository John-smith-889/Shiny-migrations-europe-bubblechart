# Shiny-migrations-europe-bubblechart

Running application in R/RStudio. Install particular packages: "shiny" and "magritts" if needed. <br />
Copy and run this code in R or RStudio:


if (!require(devtools)) <br />
  install.packages("devtools")
devtools::install_github("jcheng5/googleCharts") <br />
library(shiny) <br />
library(magrittr) <br />
library(googleCharts) <br />
runGitHub( "Shiny-migrations-europe-bubblechart", "James-Smith-889") <br />
