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
library(tidyverse)
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
                        max = 50,
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
      colors <- viridis(input$bins, alpha = 1, begin = 0, end = 1, direction = 1, option = "B")
      
      ggplot(data = faithful)+
        geom_histogram(aes(x = waiting), 
                       bins = input$bins, fill = colors)+
        labs(title = "Histogram of waiting times", 
             x = "Waiting time to next eruption (in mins)", 
             y = "Count")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
