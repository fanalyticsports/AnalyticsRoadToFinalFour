## Select the file from the file chooser
fileToLoad <- file.choose(new = TRUE)
## Read in the CSV data and store it in a variable 
origAddress <- read.csv(fileToLoad, stringsAsFactors = FALSE)
## View Table 
View(origAddress)
##Library GGMAP 
library(ggmap)
## Initialize the data frame
geocoded <- data.frame(stringsAsFactors = FALSE)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
# Stadium
for(i in 1:nrow(origAddress))
{
  # Print("Working...")
  result <- geocode(origAddress$Stadium_City_State[i], output = "latlona", source = "google")
  origAddress$lon[i] <- as.numeric(result[1])
  origAddress$lat[i] <- as.numeric(result[2])
  origAddress$geoAddress[i] <- as.character(result[3])
}

## View Table 
View(origAddress)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
# Home Team 
for(i in 1:nrow(origAddress))
{
  # Print("Working...")
  result <- geocode(origAddress$Home_City_State[i], output = "latlona", source = "google")
  origAddress$lon_ht[i] <- as.numeric(result[1])
  origAddress$lat_ht[i] <- as.numeric(result[2])
  origAddress$geoAddress_ht[i] <- as.character(result[3])
}

## View Table 
##View(origAddress)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
# Away Team 
for(i in 1:nrow(origAddress))
{
  # Print("Working...")
  result <- geocode(origAddress$Away_City_State[i], output = "latlona", source = "google")
  origAddress$lon_at[i] <- as.numeric(result[1])
  origAddress$lat_at[i] <- as.numeric(result[2])
  origAddress$geoAddress_ht[i] <- as.character(result[3])
}

## View Table 
View(origAddress)


## Get Distance Between Coordiantes

##devtools::install_github("tidyverse/magrittr")
##install.packages("dplyr")
library(magrittr)
library(dplyr)
library(geosphere)

origAddress %>% head()

## Get Home Distance from Center
hdistanceFromStadium = by(origAddress, 1:nrow(origAddress), function(row) { distHaversine(c(row$lon_ht, row$lat_ht), c(row$lon, row$lat))  })


## Get Away Distance from Center
adistanceFromStadium = by(origAddress, 1:nrow(origAddress), function(row) { distHaversine(c(row$lon_at, row$lat_at), c(row$lon, row$lat))  })

## Add in hdistance and adistance 

hout = mutate(origAddress, hdistanceFromStadium)
finalout = mutate(hout, adistanceFromStadium)

##Write to a CSV Out File 
# Write a CSV file to working directory
##write.csv(finalout, "geocoded_ncaa_distance.csv")
write.csv(finalout, "/Users/shawngerou/desktop/geocode_ncaa_distance_14_17.csv")






