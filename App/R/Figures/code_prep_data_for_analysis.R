
prep_data_for_analysis = function(cityTmp, exposureTmp, outcomeTmp){
  ## Prep Exposure Data
  exposureDataTmp = clean__zcta_indicators %>% 
    filter(city == cityTmp,
           outcome_label == exposureTmp) %>% 
    select(zcta, city, exposure_value = value) 
  exposureObj = list(name = exposureTmp, data = exposureDataTmp)
  
  ## Prep Outcome Data
  outcomeDataTmp = clean__tidy_yelp %>%
    select(city, zcta, outcome_value = all_of(outcomeTmp),name, lat, lng) %>% 
    filter(city == cityTmp,outcome_value) 
  outcomeObj = list(name = outcomeTmp, data = outcomeDataTmp)
  
  ## Merge grocery data to neighborhood data
  dfMerge = exposureObj$data %>% 
    mutate(outcome_value = zcta%in%outcomeObj$data$zcta) 
  
  ## Return Object
  list(exposureObj = exposureObj,
       outcomeObj = outcomeObj,
       dfMerge = dfMerge)
}