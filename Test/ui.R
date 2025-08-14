# Data Science Capstone_Final Project Submission

library(shiny)

shinyUI(fluidPage(
    titlePanel("Phrase Prediction"),
    sidebarLayout(
        sidebarPanel(
            h2("This App will give out three most possible three-word phrase according to the data of Twitter."),
            textInput("test_phrase","Please enter the two words here:"),
            h3("Please wait for a few seconds for result..."),
            submitButton("Submit") 

        ),
        mainPanel(          
            h3("The three most possible phrase:"),
            textOutput("predict_word1"),
            textOutput("predict_word2"),
            textOutput("predict_word3")
        )
    )
))
