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
  
  ## Local Dependencies
  load("../../Clean/xwalk_zip_zcta.rdata")
  
}

{ # 1. Yelp Data  ---- 
  
  ## Stream in NDJSON (Newline deliminted JSON)
  yelp_raw  = stream_in(file("raw data/yelp_academic_dataset_business.json")) %>% 
    as_tibble() 
  
  ## Subset
  df_subset = yelp_raw %>% 
    select(id = business_id, name, city,zip = postal_code ,
           lat= latitude, lng = longitude, 
           stars, review_count, 
           categories) %>% 
    filter(city%in%c("Austin","Portland","Boston"))
    
  
  ## Clean attributes 
  cleaned__tidy_yelp = df_subset %>% 
    left_join(xwalk_zip_zcta) %>%  filter(!is.na(zcta)) %>% 
    mutate(grocery = str_detect(categories,"Grocery"),
           health_market = str_detect(categories,'Health Markets'),
           restaurants = str_detect(categories,"Restaurants"),
           fast_food =str_detect(categories,"Fast Food")) %>% 
    select(name, city, zcta, lat, lng, stars, review_count, grocery, health_market, restaurants, fast_food)
}
 

{ # 2. Save-----
  save(cleaned__tidy_yelp, file = "processed data/cleaned__tidy_yelp.rdata")
  fwrite(cleaned__tidy_yelp, file = "processed data/cleaned__tidy_yelp.csv")
}
