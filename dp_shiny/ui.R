
library(shiny)


shinyUI(pageWithSidebar(


  headerPanel("Shiny Car Select! - Find your Eithies Drearm Car with Shiny"),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("tmpg", 
                "Miles per Galleon:", 
                min = min(mtcars$mpg),
                max = max(mtcars$mpg), 
                value = quantile(mtcars$mpg,c(0,1))),
    sliderInput("tweight", 
                "Weight:", 
                min = min(mtcars$wt),
                max = max(mtcars$wt), 
                value = quantile(mtcars$wt,c(0,1))),
    sliderInput("thp", 
                "Horsepower:", 
                min = min(mtcars$hp),
                max = max(mtcars$hp), 
                value = quantile(mtcars$hp,c(0,1))),

    checkboxInput("tam", "Only Automatic Transmission", FALSE)

  ),

  # Show a plot of the generated distribution
  mainPanel(
     h1("First level title"),
      p("Use the sliders to the right to select your favorite car by MPG, Weight, and Horsepower. 
        You can  also chose to limit your selection to cars that have automatic transmission only"),
      p("All cars that fit your selection are shown below. I have also included a summary 
        of all cars in the current selection, so that you can see how your cars compares "),
    tableOutput("scars"),
    tableOutput("sums")
  )
))