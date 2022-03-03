library(raster)
library(tidyverse)
library(sf)


chelsa_stack <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/Chelsa Data/CHELSA_bio", c(1,2,5,6,12,13,14), "_1981-2010_V.2.1.tif"))
#plot(chelsa_stack[[1]])

afrotropical_region <- st_read("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/Afrotropical region/afrotropical_region.shp", crs = 4326)

chelsa_cropped <- crop(chelsa_stack, afrotropical_region)
#plot(chelsa_cropped[[1]])

bios <- c(1,2,5,6,12,13,14)
layers <- 1:7

for (i in layers){
  r <- chelsa_cropped[[i]]
  agg <- aggregate(r, fact = 5, fun = mean)
  writeRaster(agg, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/Chelsa Data/Cropped Chelsa Data/agg_cropped_CHELSA_layer", i, ".tif"), overwrite = TRUE)
}
