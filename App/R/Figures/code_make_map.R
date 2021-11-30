make_map = function(dataTmp, sf_zcta_bchc_simp ){
  
  ## Prepare ZCTA polygons
  exposureObj=dataTmp$exposureObj
  outcomeObj= dataTmp$outcomeObj 
  cityTmp =  unique(exposureObj$data$city)
  sfTmp = sf_zcta_bchc_simp %>%
    filter(city == cityTmp) %>% 
    left_join(exposureObj$data) %>% 
    mutate(tooltip = paste0("ZCTA: ",zcta,"<br>",exposureObj$name,": ", exposure_value))
  
  ## Prepare pallete
  pal <- colorQuantile(
    palette = "YlGnBu",
    domain = sfTmp$exposure_value,
    n=5
  )
  
  ## Make Map
  leaflet() %>% 
    addTiles() %>% 
    addPolygons(data = sfTmp,
                weight = 1, opacity = 1, fillOpacity = 0.8,
                color = 'black',
                fillColor  = ~pal(exposure_value),
                label = ~map(tooltip,~HTML(.x))) %>%
    addLegend(data = sfTmp,
              position = "bottomright", pal = pal, values = ~exposure_value,
              title =exposureObj$name,
              opacity = 1) %>% 
    addMarkers(data = outcomeObj$data,
               clusterOptions = markerClusterOptions(),
               label= ~name)
}