####################################################################
## This project is designed to visualize the land use change      ##
## between RCPs and SSPs in various years.                        ##
## Original data: https://data.pnnl.gov/group/nodes/dataset/13192 ##
## Paper: https://www.nature.com/articles/s41597-020-00669-x#Sec2 ##
####################################################################


library(raster)
library(tidyverse)
library(RColorBrewer)



### SSP1/RCP2.6/Year 2020
### Open and plot first variable
b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020.nc", varname="PFT0")
b <- flip(t(b), direction = 'x')
crs(b) <- "+init=epsg:4326"
plot(b)
writeRaster(b,"C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020_PFT0.tif", overwrite=TRUE)
### "PFT0" is % of cell that is water - not mentioned in methods


### Loop for all variables
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020_PFT", i, ".tif"), overwrite=TRUE)
}



### SSP1/RCP2.6/Year 2050
### Open and plot first variable
b1 <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050.nc", varname="PFT0")
b1 <- flip(t(b1), direction='x')
crs(b1) <- "+init=epsg:4326"
plot(b1)
writeRaster(b1,"C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050_PFT0.tif", overwrite=TRUE)


### Loop for all variables in SSP1/RCP2.6/Year 2050
for (i in 0:32){
  b1 <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050.nc", varname= paste0("PFT", i))
  b1 <- flip(t(b1), direction='x')
  crs(b1) <- "+init=epsg:4326"
  writeRaster(b1, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050_PFT", i, ".tif"), overwrite=TRUE)
}



### "Natural" lands, SSP1/RCP2.6

## 2020

natural_2020 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2020/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020_PFT", 1:14, ".tif"))
sum_natural_2020 <- sum(natural_2020)
plot(sum_natural_2020, main = "Natural Lands, 2020")

# ### Save plot to folder
# # 1. Open jpeg file
# jpeg("ssp1_rcp26_2020_natural.jpg")
# # 2. Create the plot
# plot(sum_natural_2020, main = "Natural Lands, 2020")
# # 3. Close the file
# dev.off()

## 2050

natural_2050 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2050/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050_PFT", 1:14, ".tif"))
sum_natural_2050 <- sum(natural_2050)
plot(sum_natural_2050)


## Map change between years
change_natural_126 <- (sum_natural_2050 - sum_natural_2020)
plot(change_natural_126, main = "Change in natural")

writeRaster(change_natural_126, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/natural_change_2020-2050_126.tif")


### "Human-dominated" lands, SSP1/RCP2.6

# 2020

human_dominated_2020 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2020/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020_PFT", 15:31, ".tif"))
sum_human_dominated_2020 <- sum(human_dominated_2020)
plot(sum_human_dominated_2020)

# 2050

human_dominated_2050 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2050/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050_PFT", 15:31, ".tif"))
sum_human_dominated_2050 <- sum(human_dominated_2050)
plot(sum_human_dominated_2050)

# Map change between years

change_human_126 <- (sum_human_dominated_2050 - sum_human_dominated_2020)
plot(change_human_126, main = "Change in human dominated")

writeRaster(change_human_126, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/human_change_2020-2050_126.tif")










### SSP5/RCP8.5/Year 2020
for (i in 0:32){
  b2 <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2020.nc", varname = paste0("PFT", i))
  b2 <- flip(t(b2), direction = "x")
  crs(b2) <- "+init=epsg:4326"
  writeRaster(b2, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2020/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2020_PFT", i, ".tif"), overwrite = TRUE)
}


### SSP5/RCP8.5/Year 2050
for (i in 0:32){
  b2 <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2050.nc", varname = paste0("PFT", i))
  b2 <- flip(t(b2), direction = "x")
  crs(b2) <- "+init=epsg:4326"
  writeRaster(b2, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2050/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2050_PFT", i, ".tif"), overwrite = TRUE)
}


### "Natural" lands, SSP5/RCP8.5

## 2020

natural_2020_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2020/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2020_PFT", 1:14, ".tif"))
sum_natural_2020_585 <- sum(natural_2020_585)
plot(sum_natural_2020_585, main = "Natural Lands, 2020, SSP5/RCP8.5")

## 2050

natural_2050_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2050/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2050_PFT", 1:14, ".tif"))
sum_natural_2050_585 <- sum(natural_2050_585)
plot(sum_natural_2050_585, main = "Natural Lands, 2050, SSP5/RCP8.5")

## Map change between years
change_natural_585 <- (sum_natural_2050_585 - sum_natural_2020_585)
plot(change_natural_585, main = "Change in natural, SSP5/RCP8.5")

writeRaster(change_natural_585, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/natural_change_2020-2050_585.tif")


### "Human-dominated" lands, SSP5/RCP8.5

## 2020

human_dominated_2020_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2020/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2020_PFT", 15:31, ".tif"))
sum_human_dominated_2020_585 <- sum(human_dominated_2020_585)
plot(sum_human_dominated_2020_585)

## 2050

human_dominated_2050_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2050/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2050_PFT", 15:31, ".tif"))
sum_human_dominated_2050_585 <- sum(human_dominated_2050_585)
plot(sum_human_dominated_2050_585)


## Map change between years

change_human_585 <- (sum_human_dominated_2050_585 - sum_human_dominated_2020_585)
plot(change_human_585, main = "Change in human dominated, SSP5/RCP8.5")

writeRaster(change_human_585, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/human_change_2020-2050_585.tif", overwrite = TRUE)






### SSP3/RCP6.0/Year 2020
### Loop for all variables
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2020.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2020/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2020_PFT", i, ".tif"), overwrite=TRUE)
}


### SSP3/RCP6.0/Year 2050
### Loop for all variables
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2050.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2050/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2050_PFT", i, ".tif"), overwrite=TRUE)
}

### SSP3/RCP6.0/Year 2015
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2015.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2015/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2015_PFT", i, ".tif"), overwrite=TRUE)
}




### "Natural" lands, SSP3/RCP6.0

## 2015

natural_360_2015 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2015/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2015_PFT", 1:14, ".tif"))
sum_natural_2015_360 <- sum(natural_360_2015)
# Write to it's own file
writeRaster(sum_natural_2015_360, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/natural_360_2015.tif", overwrite = TRUE)

## 2020

natural_2020_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2020/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2020_PFT", 1:14, ".tif"))
sum_natural_2020_360 <- sum(natural_2020_360)
plot(sum_natural_2020_360, main = "Natural Lands, 2020, SSP3/RCP6.0")

## 2050

natural_2050_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2050/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2050_PFT", 1:14, ".tif"))
sum_natural_2050_360 <- sum(natural_2050_360)
plot(sum_natural_2050_360, main = "Natural Lands, 2050, SSP3/RCP6.0")


## Map change between years
change_natural_360 <- (sum_natural_2050_360 - sum_natural_2020_360)
plot(change_natural_360, main = "Change in natural, SSP3/RCP6.0")

writeRaster(change_natural_360, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/natural_change_2020-2050_360.tif")



### "Human-dominated" lands, SSP3/RCP6.0


## 2015
human_dominated_2015_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2015/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2015_PFT", 15:31, ".tif"))
sum_human_dominated_2015_360 <- sum(human_dominated_2015_360)
# Write to it's own file
writeRaster(sum_human_dominated_2015_360, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/human_dominated_360_2015.tif", overwrite = TRUE)

## 2020

human_dominated_2020_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2020/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2020_PFT", 15:31, ".tif"))
sum_human_dominated_2020_360 <- sum(human_dominated_2020_360)
plot(sum_human_dominated_2020_360)

## 2050

human_dominated_2050_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2050/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2050_PFT", 15:31, ".tif"))
sum_human_dominated_2050_360 <- sum(human_dominated_2050_360)
plot(sum_human_dominated_2050_360)

## Map change between years

change_human_360 <- (sum_human_dominated_2050_360 - sum_human_dominated_2020_360)
plot(change_human_360, main = "Change in human dominated, SSP3/RCP6.0")

writeRaster(change_human_360, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/human_change_2020-2050_360.tif")



### SSP2/RCP4.5/Year 2020
### Loop for all variables
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2020.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2020/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2020_PFT", i, ".tif"), overwrite=TRUE)
}

### SSP2/RCP4.5/Year 2050
### Loop for all variables
for (i in 0:32){
  b <- brick("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2050.nc", varname= paste0("PFT", i))
  b <- flip(t(b), direction='x')
  crs(b) <- "+init=epsg:4326"
  writeRaster(b, paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2050/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2050_PFT", i, ".tif"), overwrite=TRUE)
}

### "Natural" lands, SSP2/RCP4.5

## 2020

natural_2020_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2020/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2020_PFT", 1:14, ".tif"))
sum_natural_2020_245 <- sum(natural_2020_245)
plot(sum_natural_2020_245, main = "Natural Lands, 2020, SSP2/RCP4.5")

## 2050

natural_2050_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2050/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2050_PFT", 1:14, ".tif"))
sum_natural_2050_245 <- sum(natural_2050_245)
plot(sum_natural_2050_245, main = "Natural Lands, 2050, SSP2/RCP4.5")


## Map change between years
change_natural_245 <- (sum_natural_2050_245 - sum_natural_2020_245)
plot(change_natural_245, main = "Change in natural, SSP2/RCP4.5")

writeRaster(change_natural_245, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/natural_change_2020-2050_245.tif")


### "Human-dominated" lands, SSP2/RCP4.5

## 2020

human_dominated_2020_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2020/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2020_PFT", 15:31, ".tif"))
sum_human_dominated_2020_245 <- sum(human_dominated_2020_245)
plot(sum_human_dominated_2020_245)

## 2050

human_dominated_2050_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2050/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2050_PFT", 15:31, ".tif"))
sum_human_dominated_2050_245 <- sum(human_dominated_2050_245)
plot(sum_human_dominated_2050_245)

## Map change between years

change_human_245 <- (sum_human_dominated_2050_245 - sum_human_dominated_2020_245)
plot(change_human_245, main = "Change in human dominated, SSP2/RCP4.5")

writeRaster(change_human_245, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/human_change_2020-2050_245.tif")






### Bioenergy
# SSP1/RCP2.6
bioenergy_stack_2020_126 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2020/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2020_PFT", 29:30, ".tif"))
total_bioenergy_2020_126 <- sum(bioenergy_stack_2020_126)
# plot(total_bioenergy_2020, main = "Bioenergy, 2020, SSP1/RCP2.6")

bioenergy_stack_2050_126 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp1_rcp26_2050/GCAM_Demeter_LU_ssp1_rcp26_modelmean_2050_PFT", 29:30, ".tif"))
total_bioenergy_2050_126 <- sum(bioenergy_stack_2050_126)
# plot(total_bioenergy_2050, main = "Bioenergy, 2050, SSP1/RCP2.6")

bioenergy_change_126 <- (total_bioenergy_2050_126 - total_bioenergy_2020_126)

writeRaster(bioenergy_change_126, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/bioenergy_change_2020-2050_126.tif")


# SSP2/RCP4.5
bioenergy_stack_2020_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2020/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2020_PFT", 29:30, ".tif"))
total_bioenergy_2020_245 <- sum(bioenergy_stack_2020_245)

bioenergy_stack_2050_245 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp2_rcp45_2050/GCAM_Demeter_LU_ssp2_rcp45_modelmean_2050_PFT", 29:30, ".tif"))
total_bioenergy_2050_245 <- sum(bioenergy_stack_2050_245)

bioenergy_change_245 <- (total_bioenergy_2050_245 - total_bioenergy_2020_245)

writeRaster(bioenergy_change_245, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/bioenergy_change_2020-2050_245.tif")



# SSP3/RCP6.0
bioenergy_stack_2020_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2020/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2020_PFT", 29:30, ".tif"))
total_bioenergy_2020_360 <- sum(bioenergy_stack_2020_360)

bioenergy_stack_2050_360 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp3_rcp60_2050/GCAM_Demeter_LU_ssp3_rcp60_modelmean_2050_PFT", 29:30, ".tif"))
total_bioenergy_2050_360 <- sum(bioenergy_stack_2050_360)

bioenergy_change_360 <- (total_bioenergy_2050_360 - total_bioenergy_2020_360)

writeRaster(bioenergy_change_360, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/bioenergy_change_2020-2050_360.tif")



# SSP5/RCP8.5
bioenergy_stack_2020_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2020/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2020_PFT", 29:30, ".tif"))
total_bioenergy_2020_585 <- sum(bioenergy_stack_2020_585)

bioenergy_stack_2050_585 <- stack(paste0("C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/ssp5_rcp85_2050/GCAM_Demeter_LU_ssp5_rcp85_modelmean_2050_PFT", 29:30, ".tif"))
total_bioenergy_2050_585 <- sum(bioenergy_stack_2050_585)

bioenergy_change_585 <- (total_bioenergy_2050_585 - total_bioenergy_2020_585)

writeRaster(bioenergy_change_585, filename = "C:/Users/tlock/Desktop/Arnhold Fellowship Work/GCAM_land_use_change/gcam_land_use_change/data/bioenergy_change_2020-2050_585.tif")


