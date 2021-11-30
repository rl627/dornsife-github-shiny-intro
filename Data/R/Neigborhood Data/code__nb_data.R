{ # 0. Setup -----
  
  ## Dependencies
  library(dplyr)
  library(tidyr)
  library(data.table)
  library(rstudioapi)
  library(stringr)
  library(sf)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  
  ## Load Dependencies
  load("../../Clean/xwalk_zcta_bchc.rdata")
  
  load("BCHC data/clean_tidy_equity_measures_zip.rdata")
  load("BCHC data/clean_ineq_zcta.rdata")
}

{ # 1. ZCTA level data  ---- 
  clean__zcta_indicators = tidy_zip_exposures
}
 

{ # 2. Save-----
  save(clean__zcta_indicators, file = "processed data/clean__zcta_indicators.rdata")
  fwrite(clean__zcta_indicators, file = "processed data/clean__zcta_indicators.csv")
}
