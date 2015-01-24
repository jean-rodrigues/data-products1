library(shiny)
require(rCharts)
#options(RCHART_LIB = 'nvd3')


shinyUI(fluidPage(
  titlePanel("Simple Shiny App"),
  
    mainPanel(
      h3("Introduction Info"),
      p("This simple App will ask for some information about you and do some simple text manipulation with the data provided."),
      p("No text will be diplayed until you provide a name. If the text box becomes red, you probably made a mistake. Age must be a number between 5 and 120."),
      p("This app will show a bar chart from HairEyeColor data set filtered by your hair and sex info."),
      textInput("name", label = "Tell us your name:"),
      selectInput("sex", label = "Your sex:", choices = c("Male", "Female")),
      selectInput("eye", label = "Your eye color:", choices = c("Blue", "Brown", "Green", "Hazel")),
      selectInput("hair", label = "Your hair color:", choices = c("Black", "Blond", "Brown", "Red")),
      numericInput("age", label = "Age:", min = 5, max = 120, value=5),
      br(),
      submitButton("Submit"),      
      br(),
      p("Processed data: ", verbatimTextOutput("nameText")),
      p("Below, a bar chart showing distribution of eye colors versus hair colors accordingly to sex and hair type provided (from HairEyeColor dataset)"),
      showOutput("myChart", "nvd3"),
      p("You can click on the chart to perform different arrangements.")
  )
))