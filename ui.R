library(shiny)
library(rCharts)

# Define UI 
shinyUI(fluidPage(
        titlePanel("The population growth of current million cities in Germany"),
        
        # Sidebar 
        sidebarLayout(
                sidebarPanel(
                        h5("Learn how the population of the four largest",
                           "cities has developed since 1900."),
                        br(),
                        radioButtons(inputId = "city", 
                                    label = "Select a city:", 
                                    choices = c("Cologne", "Berlin", "Hamburg", "Munich"), 
                                    selected = "Cologne"), 
                        br(),
                        sliderInput("range",
                                    label = "Years to display:",
                                    min = 1900,
                                    max = 2030,
                                    value = c(1900, 2013), 
                                    format = "0000"), 
                        br(),
                        helpText("The values for the years from 2013",
                                 "and later are existing forecasts.", 
                                 "Please hover over the lines to get exact",
                                 "values or click on the *Raw Data* tab.",
                                 "For more infomation on how the data was", 
                                 "collected and how the app works,",
                                 "please see the documentation:")
                ),
                
                # Show the plot 
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plot", showOutput("plot", "highcharts")),
                                tabPanel("Raw Data", dataTableOutput("table"))
                        )
                )
        )
))