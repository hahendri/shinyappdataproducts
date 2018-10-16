library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Air Quality in New York by Temperature"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderTemp",
                   "Enter the temperature in New York City in Fahrenheit",
                   min = 56,
                   max = 97,
                   value = 65)
    ),
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Air Quality from Model 1:"),
       textOutput("pred1")
    )
  )
))
