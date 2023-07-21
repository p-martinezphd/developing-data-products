library(shiny)

# Define UI for dataset viewer app ----
ui <- fluidPage(
        
        # App title ----
        titlePanel("More Widgets"),
        
        # Sidebar layout with input and output definitions ----
        sidebarLayout(
                
                # Sidebar panel for inputs ----
                sidebarPanel(
                        
                        # Input: Select a dataset ----
                        selectInput("dataset", "Choose a dataset:",
                                    choices = c("rock", "pressure", "mtcars", "USArrests","iris")),
                        
                        
                        # Include clarifying text ----
                        helpText("Instructions: This shiny app is desinged to provide Summary Statistics and show the data",
                                 "for datasets built-in R Studio. Please select dataset and click update view"),
            
                        actionButton("update", "Update View")
                        
                ),
                
                # Main panel for displaying outputs ----
                mainPanel(
                        
                        # Output: Header + summary of distribution ----
                        h4("Summary"),
                        verbatimTextOutput("summary"),
                        
                        h4("Head"),
                        verbatimTextOutput("head",50),
                        
                )
                
        )
)