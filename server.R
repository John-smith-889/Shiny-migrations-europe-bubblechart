library(dplyr)


shinyServer(function(input, output, session) {
  
  # Provide explicit colors for regions, so they don't get recoded when the
  # different series happen to be ordered differently from year to year.
  # http://andrewgelman.com/2014/09/11/mysterious-shiny-things/
  defaultColors <- c("#3366cc", "#dc3912", "#ff9900", "#109618")  ###  4 colours for my 4 regions
  series <- structure(
    lapply(defaultColors, function(color) { list(color=color) }),
    names = levels(data$Region)                                    
  )
  
  yearData <- reactive({
    # Filter to the desired year, and put the columns
    # in the order that Google's Bubble Chart expects
    # them (name, x, y, color, size). Also sort by region
    # so that Google Charts orders and colors the regions
    # consistently.
    df <- data %>%
      filter(Year == input$year) %>%
      select(Country, Migrant.Stock, Refugee.Stock,    ### there we can manipulate and switch x with y
             Region, Population) %>%
      arrange(Region)                      
  })
  
  output$chart <- reactive({
    # Return the data and options
    list(
      data = googleDataTable(yearData()),  ### "data" - primary name of our downloaded data to R
      options = list(
        title = sprintf(
          "Refugee Stock vs. Migrants Stock",   ### Chart title
          input$year),      ### our slider is associated with year variable
        series = series
      )
    )
  })
})


# Code is modified version of https://github.com/jcheng5 work