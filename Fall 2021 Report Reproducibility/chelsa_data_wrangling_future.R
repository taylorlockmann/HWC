library(raster)
library(tidyverse)
library(sf)

### 2011-2040 SSP1 RCP 2.6
chelsa_2011_2040_stack <- stack(paste0("H:/My Drive/HWC/R_files/R_input_data/chelsa/future/CHELSA_bio", c(1,2,5,6,12,13,14), "_2011-2040_gfdl-esm4_ssp126_V.2.1.tif"))

#plot(chelsa_2011_2040_stack[[1]])

afrotropical_region <- st_read("H:/My Drive/HWC/R_files/R_output_data/afrotropical_region/afrotropical_region.shp", crs = 4326)

chelsa_2011_2040_cropped <- crop(chelsa_2011_2040_stack, afrotropical_region)
#plot(chelsa_cropped[[1]])

bios <- c(1,2,5,6,12,13,14)
layers <- 1:7

for (i in layers){
  r <- chelsa_2011_2040_cropped[[i]]
  agg <- aggregate(r, fact = 5, fun = mean)
  writeRaster(agg, paste0("H:/My Drive/HWC/R_files/R_output_data/chelsa/future/agg_cropped_CHELSA_future_layer", i, ".tif"), overwrite = TRUE)
}

### 2041-2070 SSP1 RCP2.6
chelsa_2041_2070_126_stack <- stack(paste0("H:/My Drive/HWC/R_files/R_input_data/chelsa/future/CHELSA_bio", c(1,2,5,6,12,13,14), "_2041-2070_gfdl-esm4_ssp126_V.2.1.tif"))

#plot(chelsa_2011_2040_stack[[1]])

chelsa_2041_2070_126_cropped <- crop(chelsa_2041_2070_126_stack, afrotropical_region)
#plot(chelsa_cropped[[1]])

for (i in layers){
  r <- chelsa_2041_2070_126_cropped[[i]]
  agg <- aggregate(r, fact = 5, fun = mean)
  writeRaster(agg, paste0("H:/My Drive/HWC/R_files/R_output_data/chelsa/future/agg_cropped_CHELSA_2041_2070_126_", i, ".tif"), overwrite = TRUE)
}


### 2041-2070 SSP3 RCP 7
chelsa_2041_2070_370_stack <- stack(paste0("H:/My Drive/HWC/R_files/R_input_data/chelsa/future/CHELSA_bio", c(1,2,5,6,12,13,14), "_2041-2070_gfdl-esm4_ssp370_V.2.1.tif"))

plot(chelsa_2041_2070_370_stack[[1]])

chelsa_2041_2070_370_cropped <- crop(chelsa_2041_2070_370_stack, afrotropical_region)

plot(chelsa_2041_2070_370_cropped[[5]])

for (i in layers){
  r <- chelsa_2041_2070_370_cropped[[i]]
  agg <- aggregate(r, fact = 5, fun = mean)
  writeRaster(agg, paste0("H:/My Drive/HWC/R_files/R_output_data/chelsa/future/agg_cropped_CHELSA_2041_2070_", i, ".tif"), overwrite = TRUE)
}


### 2041-2070 SSP5 RCP8.5
chelsa_2041_2070_585_stack <- stack(paste0("H:/My Drive/HWC/R_files/R_input_data/chelsa/future/CHELSA_bio", c(1,2,5,6,12,13,14), "_2041-2070_gfdl-esm4_ssp370_V.2.1.tif"))

#plot(chelsa_2011_2040_stack[[1]])

chelsa_2041_2070_585_cropped <- crop(chelsa_2041_2070_585_stack, afrotropical_region)
#plot(chelsa_cropped[[1]])

for (i in layers){
  r <- chelsa_2041_2070_585_cropped[[i]]
  agg <- aggregate(r, fact = 5, fun = mean)
  writeRaster(agg, paste0("H:/My Drive/HWC/R_files/R_output_data/chelsa/future/agg_cropped_CHELSA_2041_2070_", i, ".tif"), overwrite = TRUE)
}



