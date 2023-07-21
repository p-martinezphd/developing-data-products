library(shiny)

shinyServer(function(input, output) {
        
        datasetInput <- eventReactive(input$update, {
                switch(input$dataset,
                       "rock" = rock,
                       "pressure" = pressure,
                       "mtcars" = mtcars,
                       "USArrests"= USArrests,
                       "iris" = iris)
        }, ignoreNULL = FALSE)
        
        # Generate a summary of the dataset ----
        output$summary <- renderPrint({
                dataset <- datasetInput()
                summary(dataset)
        })
        
        output$head <- renderPrint({
                dataset <- datasetInput()
                head(dataset, 50)
        })
        
        # Show the first "n" observations ----
        # The use of isolate() is necessary because we don't want the table
        # to update whenever input$obs changes (only when the user clicks
        # the action button)
        output$view <- renderTable({
                head(datasetInput(), n = isolate(input$obs))
        })
        
})

        
