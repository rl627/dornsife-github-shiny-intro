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
    
    ## 2. Subset Data
    cityTmp  = "Austin"; exposureTmp = "% Complete College"; outcomeTmp = "healthy_grocery"
    dataTmp = prep_data_for_analysis(cityTmp,  exposureTmp,   outcomeTmp)

}

# Run the application 
shinyApp(ui = ui, server = server)
