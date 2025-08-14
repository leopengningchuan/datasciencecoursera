library(shiny); library(ngram); library(readtext)

# going to

shinyServer(function(input, output) {
    df <- reactive({
        as.data.frame(read.csv("database.csv", stringsAsFactors=FALSE))[,(2:4)]
    })
    word <- reactive({
        paste("^", input$test_phrase, sep="")
    })
    
    result1 <- reactive({
        head(df()[grep(word(), df()[,1]),], 5)[1,1]
    })
    result2 <- reactive({
        head(df()[grep(word(), df()[,1]),], 5)[2,1]
    })  
    result3 <- reactive({
        head(df()[grep(word(), df()[,1]),], 5)[3,1]
    })
    
    output$predict_word1 <- renderText(result1())
    output$predict_word2 <- renderText(result2())
    output$predict_word3 <- renderText(result3())
})
