# More info:
#   https://github.com/jcheng5/googleCharts
# Install:
#   devtools::install_github("jcheng5/googleCharts")
library(googleCharts)

# Use global max/min for axes so the view window stays
# constant as the user moves between years
xlim <- list(                                                 ### x lim setting
  min = min(data$Migrant.Stock) - 300000,                   
  max = max(data$Migrant.Stock) + 1000000
)
ylim <- list(
  min = min(data$Refugee.Stock) -150000,                  ### y lim setting
  max = max(data$Refugee.Stock) + 200000               
)

shinyUI(fluidPage(
  # This line loads the Google Charts JS library
  googleChartsInit(),
  
  # Use the Google webfont "Source Sans Pro"
  tags$link(
    href=paste0("http://fonts.googleapis.com/css?",           
                "family=Source+Sans+Pro:300,600,300italic"),
    rel="stylesheet", type="text/css"),
  tags$style(type="text/css",
             "body {font-family: 'Source Sans Pro'}"
  ),
  
  h2("Migrations in Europe: 1990-2017"),
  
  googleBubbleChart("chart",
                    width="100%", height = "475px",
                    # Set the default options for this chart; they can be
                    # overridden in server.R on a per-update basis. See
                    # https://developers.google.com/chart/interactive/docs/gallery/bubblechart
                    # for option documentation.
                    options = list(
                      fontName = "Source Sans Pro",
                      fontSize = 13,
                      # Set axis labels and ranges
                      hAxis = list(
                        title = "Migrant Stock",     ### set title of X lim
                        viewWindow = xlim
                      ),
                      vAxis = list(
                        title = "Refugee Stock",      ### set title of Y lim
                        viewWindow = ylim
                      ),
                      # The default padding is a little too spaced out    
                      chartArea = list(
                        top = 50, left = 75,
                        height = "75%", width = "75%"
                      ),
                      # Allow pan/zoom
                      explorer = list(),                        
                      # Set bubble visual props
                      bubble = list(                             
                        opacity = 0.4, stroke = "none",
                        # Hide bubble label                    
                        textStyle = list(
                          color = "none"
                        )
                      ),
                      # Set fonts
                      titleTextStyle = list(
                        fontSize = 16
                      ),
                      tooltip = list(
                        textStyle = list(
                          fontSize = 12
                        )
                      )
                    )
  ),
  fluidRow(
    shiny::column(4, offset = 4,
                  sliderInput("year", "Year",                                ### input as a year
                              min = min(data$Year), max = max(data$Year),    ### limits of inputu
                              value = min(data$Year), step = 5, animate = TRUE)        ### animation settings 
    )
  )
))

# Code is modified version of https://github.com/jcheng5 work