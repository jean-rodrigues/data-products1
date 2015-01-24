library(shiny)
require(rCharts)

shinyServer(function(input, output) {
  

  inputVarSex <- reactive({
    data <- if(input$sex=="Male") { 
      paste("Mr.", input$name) 
    } else {
      paste("Ms.", input$name) 
    }
  })
  
  inputVarData <- reactive({
    validate(
      need(input$age>=5 & input$age<=120, "Please input a valid age.")
    )
    validate(
      need(nchar(input$name)>0, "Please input a valid name.")
    )
    
    data <- paste0("Hi, ", inputVarSex(), ". You are ", input$age, " years old. Your hair is ", tolower(c(input$hair)), " and eyes are ", tolower(c(input$eye)), ".") 
  })

  output$myChart <- renderChart2({
    hair_eye <- as.data.frame(HairEyeColor)
    p1 <- nPlot(Freq ~ Hair, group='Eye', data = subset(hair_eye, Sex == input$sex & Hair==input$hair), 
                   type = 'multiBarChart', id = 'myChart', width = 800)
    p1$yAxis(axisLabel = "Frequencies", width = 20, margin = list(left = 50))
    p1$xAxis(axisLabel = paste("Hair for", input$sex))
    
    p1$chart(color = c('brown', 'blue', '#594c25', 'green'))
    return(p1)
  })
  output$nameText <- renderText({inputVarData()})    
  
})