library(shiny)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

sliderValues <- reactive({
  selectedcars <- subset(mtcars,wt > input$tweight[1])
  selectedcars <- subset(selectedcars,wt < input$tweight[2])

  selectedcars <- subset(selectedcars,mpg > input$tmpg[1])
  selectedcars <- subset(selectedcars,mpg < input$tmpg[2])

  selectedcars <- subset(selectedcars,hp > input$thp[1])
  selectedcars <- subset(selectedcars,hp < input$thp[2])

  if(input$tam) {
    selectedcars <- subset(selectedcars, am == 0)
  }
  selectedcars
})

  output$scars <- renderTable({sliderValues()})
  output$sums <- renderTable({summary(sliderValues())})
})

