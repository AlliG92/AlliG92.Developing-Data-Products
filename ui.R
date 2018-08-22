#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calculate Term GPA"),
  
  # Sidebar with drop down
  sidebarLayout(
    sidebarPanel(
      p(h5("Enter the number of hours / credits per class")),
      p(h5("The minimum number of hours is 1 and the maximum is 5")),
      p(h5("Then enter the letter grade received")),
      p(h5("Enter 0 for the credit hours for all of the classes not taken")),
      p(textOutput("creditHours")),
      p(textOutput("finalGPA")),
      actionButton("total", label = "Total")     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p(h5("GPA:")),
      selectInput("grade1","Choose Class 1 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      numericInput("credits1",
                   label = h4("Enter Class 1 Credit Hours"),
                   min = 0, max = 5, value = 1),
      br(),
      selectInput("grade2", "Enter Class 2 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      br(),            
      numericInput("credits2",
                   label = h4("Enter Class 2 Credit Hours"),
                   min = 0, max = 5, value = 1),
      br(),
      selectInput("grade3","Enter Class 3 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      br(),            
      numericInput("credits3",
                   label = h4("Enter Class 3 Credit Hours"),
                   min = 0, max = 5, value = 1),
      br(),
      selectInput("grade4","Enter Class 4 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      br(),            
      numericInput("credits4",
                   label = h4("Enter Class 4 Credit Hours"),
                   min = 0, max = 5, value = 1),
      br(),
      selectInput("grade5", "Enter Class 5 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      br(),            
      numericInput("credits5",
                   label = h4("Enter Class 5 Credit Hours"),
                   min = 0, max = 5, value = 1),
      br(),
      selectInput("grade6", "Enter Class 6 Letter Grade:",
                   c("A","A-","B+","B","B-","C+","C","C-","D+","D","D-", "F")),
      br(),            
      numericInput("credits6",
                   label = h4("Enter Class 6 Credit Hours"),
                   min = 0, max = 5, value = 1)
    )
  )
)
)