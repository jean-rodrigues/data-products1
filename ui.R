library(shiny)

shinyUI(fluidPage(
  titlePanel("Simple Shiny App"),
  
#   sidebarLayout(
#     sidebarPanel(
#       p("Shiny is available on CRAN, just install it:"),
#       code('install.packages("shiny")')
#     ),
    mainPanel(
      h3("Introduction"),
      p("This simple App will ask for some information about you and do some simple text manipulation with the data provided."),
      p("No text will be diplayed until you provide a name. If the text box becomes red, you probably made a mistake. Age must be a number between 5 and 120."),
      p(),
      textInput("name", label = "Tell us your name:"),
      selectInput("sex", label = "Your sex:", choices = c("Male", "Female")),
      numericInput("age", label = "Age:", min = 5, max = 120, value=5),
      br(),
      submitButton("Submit"),      
      br(),
      p("Processed data: ", verbatimTextOutput("nameText"))
#     )
  )
))