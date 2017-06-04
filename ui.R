##Shiny Library
library(shiny) 
##UI Pages
shinyUI(
  pageWithSidebar(
    # Application title: Topic is calculating the body fat.
    headerPanel("Body Mass Index (BMI) Calculator"),
    ##Sidebar Panel for weight/height: Default Setting 55kg, 1.70m
    sidebarPanel(
      numericInput('weight', 'Insert your weight(kg)', 55) ,
      numericInput('height', 'Insert your height(meter)', 1.70, min = 1.0, max = 2, step = 0.01),
      submitButton('Submit')
    ), 
    # Main Panel: Print the body fat and description.
    mainPanel(
      p('The World Health Organization (WHO) announcement about body fat as below.'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=30        : Obesity')
        )
      ),
      ##Getting the Value from the Server and then display.
      h4('Taking into account the values entered by you:'), 
      p('weight:'), verbatimTextOutput("inputweightvalue"),
      p('height:'), verbatimTextOutput("inputheightvalue"),
      p('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
    )
  )   
)
