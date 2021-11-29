{ # 0.1 Setup -----
  
  ## Dependencies
  library(dplyr)
  library(rjson)
  library(data.table)
  library(rstudioapi)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  
  }