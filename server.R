library(shiny)

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
    
    data <- paste0("Hi, ", inputVarSex(), ". You are ", input$age, " years old.") 
  })

  
  output$nameText <- renderText({inputVarData()})    
  
})