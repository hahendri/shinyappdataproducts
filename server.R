library(shiny)

shinyServer(function(input, output) {
      model1 <- lm(Ozone ~ Temp, data = airquality)
      
      model1pred <- reactive({
            tempInput <- input$sliderTemp
            predict(model1, newdata = data.frame(Temp = tempInput))
      })
      
output$plot1 <- renderPlot({
      tempInput <- input$sliderTemp
    
      plot(airquality$Temp, airquality$Ozone, xlab = "NYC Temperature in Fahrenheit",
           ylab = "Airquality (ppb)", bty = "n", pch = 16, xlim = c(56, 97), ylim = c(1, 168))
      points(tempInput, model1pred(), col = "red", pch = 16, cex = 2)
      })

output$pred1 <- renderText({
      model1pred()
      })
})