library(shiny)

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Yelp Shiny App"),

    # Sidebar layout 
    sidebarLayout(
        sidebarPanel(
           "Inputs Here"
        ),
        mainPanel(
           "Outputs Here"
        )
    )
)

# Define server logic 
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
