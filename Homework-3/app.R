#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(viridis)
library(ggplot2)
library(tidyverse)
faithful <- faithful
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 60,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        # hist(x, breaks = bins, col = 'darkgray', border = 'white')
        colors <- viridis(input$bins, alpha = 1, begin = 0, end = 1, direction = 1, option = "B")

        ggplot(data = faithful)+
          geom_histogram(aes(x = waiting), 
                         bins = input$bins, fill = colors)
          # xlab("Waiting time to next eruption (in mins)")+
          # ylab("count")+
          # title("Histogram of waiting times")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
