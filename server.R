##Getting the Library(shiny)
library(shiny) 
##Define the BMI function
BMI<-function(weight,height) {weight/(height^2)}
##defind value variable  returned from function
result<-function(weight,height){
  BMI_value<-weight/(height^2)
  ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Normal weight",ifelse(BMI_value<30,"Overweight","Obesity")))
}
##ShinyServer function and tranfor the value into the ui. 
shinyServer(
  function(input, output) {
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({result(input$weight,input$height)})
  } 
)
