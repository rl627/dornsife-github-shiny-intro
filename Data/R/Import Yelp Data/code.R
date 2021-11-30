{ # 0. Setup -----
  
  ## Dependencies
  library(dplyr)
  library(rjson)
  library(data.table)
  library(rstudioapi)
  library(jsonlite)
  library(stringr)
  
  ## Set working directory to file location
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

{ # 1. Yelp Data  ---- 
  
  ## Stream in NDJSON (Newline deliminted JSON)
  yelp_raw  = stream_in(file("../../Raw Data/yelp_academic_dataset_business.json")) %>% 
    as_tibble() %>% 
    select(id = business_id, name, city,lat= latitude, lng = longitude, 
           stars, review_count, 
           categories)

  ## Subset data
  df_subset = yelp_raw %>% filter(city%in%c("Austin","Portland","Boston"))
    
  
  ## Clean attributes 
  cleaned__tidy_yelp = df_subset %>% 
    mutate(grocery = str_detect(categories,"Grocery"),
           health_market = str_detect(categories,'Health Markets'),
           restaurants = str_detect(categories,"Restaurants"),
           fast_food =str_detect(categories,"Fast Food")) 
}
 

{ # 2. Save-----
  save(cleaned__tidy_yelp, file = "Clean/cleaned__tidy_yelp.rdata")
  fwrite(cleaned__tidy_yelp, file = "Clean/cleaned__tidy_yelp.csv")
}