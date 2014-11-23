library(shiny)
library(rCharts)

dat <- read.csv('data.csv')
source("cityData.R")

options(RCHART_WIDTH = 500)

shinyServer(function(input, output) {
        
        # Generate a chart for the selected city
        output$plot <- renderChart2({
                selected <- input$city
                city <- subset(dat, city == selected & Year %in% seq(input$range[1], input$range[2], 1))
                h1 <- hPlot(
                        x = "Year", 
                        y = "Population", 
                        data = city, 
                        type = "line")
        })
        
        # Generate an HTML table view of the data
        output$table <- renderDataTable({
                dat[,-1]
        })
})

