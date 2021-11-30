{ # 0. Setup -----
  
  ## Dependencies
  library(dplyr) 
  library(data.table)
  library(rstudioapi) 
  library(readxl)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

{ # 1. Clean crosswalk -----
  xwalk_zip_zcta = read_excel("raw data/ZiptoZcta_Crosswalk_2021.xlsx") %>% 
    select(zip = ZIP_CODE,zcta = ZCTA)
  
}


{ # 2. Save-----
  save(xwalk_zip_zcta, file = "../../../Clean/xwalk_zip_zcta.rdata")
  save(xwalk_zip_zcta, file = "processed data/xwalk_zip_zcta.rdata")
  fwrite(xwalk_zip_zcta, file = "processed data/xwalk_zip_zcta.csv")
}