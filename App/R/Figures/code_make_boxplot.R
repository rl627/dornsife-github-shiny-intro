make_boxplot = function(dataTmp){
 
  ## Prep data 
  exposureObj=dataTmp$exposureObj
  outcomeObj= dataTmp$outcomeObj 
  dfMerge = exposureObj$data %>% mutate(outcome_value = zcta%in%outcomeObj$data$zcta) 
  cityTmp = unique(exposureObj$data$city)
  titleTmp = paste("Distribution of ZCTA-level",exposureObj$name,"stratified by",outcomeObj$name)
  
  ## Plot  
  gg = dfMerge %>% 
    ggplot(aes(x= outcome_value, y = exposure_value, col = outcome_value))+
    geom_boxplot()+
    labs(x = outcomeObj$name, y = exposureObj$name,
         title = titleTmp,
         subtitle = cityTmp,
         color = outcomeObj$name)+ 
    theme_bw()
  ggplotly(gg)
}
