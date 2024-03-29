#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
        library(readxl)
        df <- read_excel("C:\\Users\\Devon DiMatteo\\Desktop\\danl310df.xlsx")
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        ggplot(data = df)+
          geom_line(aes(x = WAB, y = SEED, bins = input$bins))
        labs(title = "Relationship between WAB and SEED", 
             x = "WAB", 
             y = "SEED")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
