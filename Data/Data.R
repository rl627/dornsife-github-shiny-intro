{ # 0. Setup -----
  
  ## Dependencies
  library(dplyr)
  library(tidyr)
  library(sf)
  library(data.table)
  library(rstudioapi)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  
}

{ # 1. Prep data for analysis
  
  ## Data
  load('R/Import Yelp Data/processed data/clean__tidy_yelp.rdata')
  load('R/Neigborhood Data/processed data/clean__zcta_indicators.rdata')
  
  ## Spatial
  load('Clean/sf_zcta_bchc_simp.rdata')
  shape_file_zcta = sf_zcta_bchc_simp
  
  ## Save machine readable data
  fwrite(clean__tidy_yelp,file = 'Clean/clean__tidy_yelp.csv')
  fwrite(clean__zcta_indicators,file = 'Clean/clean__zcta_indicators.csv')
  
  ## Save Data Store for Analysis App
  save(clean__tidy_yelp, clean__zcta_indicators,shape_file_zcta, file = "Clean/analysis_bundle.rdata")

}



