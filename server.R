#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

letter_to_gpa_score <- function(letter) {
  switch(letter,
         "A" = 4,
         "A-" = 3.67,
         "B+" = 3.33,
         "B" = 3,
         "B-" = 2.67,
         "C+" = 2.33,
         "C" = 2,
         "C-" = 1.67,
         "D+" = 1.33,
         "D" = 1,
         "D-" = 0.66,
         "F" = 0)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  values <-reactiveValues()
  

  
    observe({
      input$total
      values$totalCreditHours <- isolate({
        input$credits1 + input$credits2 + input$credits3 + input$credits4 + input$credits5 + input$credits6
          })
      
      values$class1 <- isolate({
        input$credits1*letter_to_gpa_score(input$grade1)
          })
      
      values$class2 <- isolate({
        input$credits2*letter_to_gpa_score(input$grade2)
      })
      
      values$class3 <- isolate({
        input$credits3*letter_to_gpa_score(input$grade3)
      })
      
      values$class4 <- isolate({
        input$credits4*letter_to_gpa_score(input$grade4)
      })
      
      values$class5 <- isolate({
        input$credits5*letter_to_gpa_score(input$grade5)
      })
      
      values$class6 <- isolate({
        input$credits6*letter_to_gpa_score(input$grade6)
      })
      
      values$totGPA <- isolate({(values$class1 + values$class2 + values$class3 + values$class4 + values$class5 + values$class6)/values$totalCreditHours
    })
    
    output$finalGPA <- renderText({
        if(input$total != 0) 
            paste("Your term GPA equals ", round(values$totGPA, digits = 2))
    })  
        
    output$creditHours <- renderText({
        if(input$total != 0)
            paste("Your total credit hours equals ", values$totalCreditHours)
         
    })
    
    })    
  })


