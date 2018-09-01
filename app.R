library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value =25, min = 1, max =100),
  textInput(inputId = "title",
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  data <- reactive ({
    rnorm (input$num)
  })
  output$hist <- renderPlot ({
    hist(rnorm(data()), main = input$title)
  })
  output$stats <- renderPrint ({
    summary(data())
  })
}

# Run the application 
shinyApp(ui = ui, server = server) 