## 1. Dependencies
library(tidyr)
library(dplyr)
library(leaflet)
library(purrr)
library(shiny)
library(ggplot2)
library(plotly)
library(reactable)
library(sf)
library(sjPlot)
load("R/Data/analysis_bundle.rdata")
source("R/Figures/code_prep_data_for_analysis.R", local = T)
source("R/Figures/code_make_boxplot.R", local = T)
source("R/Figures/code_make_map.R", local = T)

# Define UI for application
ui <- fluidPage(
    
    # Application title
    titlePanel("Yelp Shiny App"),
    
    # Sidebar layout 
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId="exposure", 
                label ="Select Exposure:", 
                choices = unique(clean__zcta_indicators$outcome_label),
                selected = "% Complete College")
        ),
        mainPanel(
            plotlyOutput('boxplot')
        )
    )
)

# Define server logic 
server <- function(input, output) {
    
    output$boxplot = renderPlotly({
        
        ## 2. Subset Data
        dataTmp = prep_data_for_analysis("Austin",  
                                         input$exposure,   
                                         "healthy_grocery")
        
        ### 3. Boxplot
        make_boxplot(dataTmp)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
