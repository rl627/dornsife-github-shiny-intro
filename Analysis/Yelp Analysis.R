### 1. Dependencies
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


### 2. Preparing 
cityTmp  = "Austin"; exposureTmp = "% Complete College"; outcomeTmp = "healthy_grocery"
dataTmp = prep_data_for_analysis(cityTmp,  exposureTmp,   outcomeTmp)

### 3. Visualizing
make_boxplot(dataTmp)

### 4. Maping 
make_map(dataTmp,shape_file_zcta )

### 4. Modeling 
model = glm(outcome_value~exposure_value ,family=binomial(link='logit'),data=dataTmp$dfMerge)
tab_model(model)