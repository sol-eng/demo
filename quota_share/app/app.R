library(xs)
library(shiny)

ui <- fluidPage(
  
  titlePanel("Quota Share Example"),
  
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
    
    mainPanel(
      verbatimTextOutput("analysis")
    )
  )
)

server <- function(input, output) {
  
  output$analysis <- renderText({
    
    treaty <- quota_share(input$ceded, input$ceded_commission)
    
    result <- treaty %>% 
      treaty_apply_premiums(data.frame(premium = input$premium))

    capture.output(result)
  }, sep = "\n")
}

shinyApp(ui = ui, server = server)
