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
                inputId="select", 
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
    
    ## 2. Subset Data
    cityTmp  = "Austin"; exposureTmp = "% Complete College"; outcomeTmp = "healthy_grocery"
    dataTmp = prep_data_for_analysis(cityTmp,  exposureTmp,   outcomeTmp)
    
    output$boxplot = renderPlotly({
        ### 3. Boxplot
        make_boxplot(dataTmp)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
