#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(xs)
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Quota Share Example"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("ceded",
                  "Ceded Proportion:",
                  min = 0, 
                  max = 1,
                  value = 0.5),
      sliderInput("ceded_commission",
                  "Ceding Commission Rate:",
                  min = 0, 
                  max = 1,
                  value = 0.5),
      numericInput("premium",
                   "Premium:",
                   value = 10000, 
                   min = 0,
                   max = NA)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("analysis")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$analysis <- renderText({
    
    treaty <- quota_share(input$ceded, input$ceded_commission)
    
    result <- treaty %>% 
      treaty_apply_premiums(data.frame(premium = input$premium))

    capture.output(result)
  }, sep = "\n")
}

# Run the application 
shinyApp(ui = ui, server = server)
