{ # 0. Setup -----
  
  ## Dependencies
  library(dplyr)
  library(rjson)
  library(data.table)
  library(rstudioapi)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

{ # 1. Read in Yelp  ---- 
  
  ## Try with JSON Light
  dfa = fread("../../Raw Data/yelp_business.csv")
  
}
