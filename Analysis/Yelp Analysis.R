{ # 0. Setup -----
  ## Dependencies
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
  source("R/Figures/code_prep_data_for_analysis.R")
  source("R/Figures/code_make_boxplot.R")
  source("R/Figures/code_make_map.R")

  ## Set working directory to file location (Not for Shiny!)
  library(rstudioapi)
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

### 1. Prepare Data
cityTmp  = "Austin"; exposureTmp = "% Complete College"; outcomeTmp = "healthy_grocery"
dataTmp = prep_data_for_analysis(cityTmp,  exposureTmp,   outcomeTmp)

### 2. Visualize Data
make_boxplot(dataTmp)

### 3. Map Data
make_map(dataTmp,shape_file_zcta )

### 4. Model Data
model = glm(outcome_value~exposure_value ,family=binomial(link='logit'),data=dataTmp$dfMerge)
tab_model(model)