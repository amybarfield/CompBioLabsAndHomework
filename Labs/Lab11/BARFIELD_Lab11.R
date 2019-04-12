#Amy Barfield 
#Lab 11
#April 5, 2019

## PART 1 ##
#Load tydyverse library

library("tidyverse")

#Step 3
#Read in file

woodData <- read.csv("/Users/amybarfield/Downloads/GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

## PART 2 ##

#Step 4: Removing rows with missing data
#4a: which row has NA?

which(is.na(woodData$Wood.density..g.cm.3...oven.dry.mass.fresh.volume))
# answer: 12150

#4b:remove that row
woodData <- woodData[-c(12150), ]

#Step 5: Dealing with one kind of pseudo-replication
#create a table with mean wood density data per species
woodDataGrouped_Binomial <- summarise(group_by(woodData, Binomial, Family), meanDensity = mean(Wood.density..g.cm.3...oven.dry.mass.fresh.volume))

#Step 6: Contrasting most and least dense families
#6a: create a table with mean wood density data per species using table created in step 5
woodDataGrouped_Family <- summarise(group_by(woodDataGrouped_Binomial, Family), meanDensity = mean(meanDensity))

#6b: sort the results by mean data and store in data frame
meanDensity_Family <- as.data.frame(woodDataGrouped_Family[order(woodDataGrouped_Family$meanDensity),])

#6c: what are the families with the highest average densities?
top_Density <- tail(meanDensity_Family, n=8)

#Family meanDensity
#184 Asteropeiaceae   0.8318333
#185   Bonnetiaceae   0.8400000
#186       Linaceae   0.8401667
#187    Surianaceae   0.8760000
#188   Irvingiaceae   0.8794702
#189 Sarcolaenaceae   0.8987500
#190 Zygophyllaceae   0.9287593
#191   Hypericaceae   0.9850000

#6c what are the families with the lowest average densities?
low_Density <- head(meanDensity_Family, n=8)

#Family meanDensity
#1    Caricaceae   0.2133333
#2 Paulowniaceae   0.2445000
#3   Moringaceae   0.2620000
#4      Bixaceae   0.2851905
#5 Hernandiaceae   0.2861875
#6 Muntingiaceae   0.3000000
#7   Datiscaceae   0.3010000
#8 Tetramelaceae   0.3070000

## PART 3 ##
#Step 7
library("ggplot2")
# create plot of individual species from the families with the highest average densities

#make a data frame that has all of the data points for the top 8 families
top8 <- woodDataGrouped_Binomial[woodDataGrouped_Binomial$Family %in% (top_Density$Family), ]              

ggplot(top8) +
  geom_boxplot(aes(Family, meanDensity)) +
  facet_wrap( ~Family, scales="free_x")

# create plot of individual species from the families with the lowest average densities

#make a data frame that has all of the data points for the top 8 families
bottom8 <- woodDataGrouped_Binomial[woodDataGrouped_Binomial$Family %in% (low_Density$Family), ]              

ggplot(bottom8) +
  geom_boxplot(aes(Family, meanDensity)) +
  facet_wrap( ~Family, scales="free_x")

#Step 8
# make two plots where all the data is on one graph instead of facets
#For top 8
ggplot(top8) +
  geom_boxplot(aes(Family, meanDensity)) +
  coord_flip() +
  ylim(0.3, 1.2)

#For bottom 8
ggplot(bottom8) +
  geom_boxplot(aes(Family, meanDensity)) +
  coord_flip() +
  ylim(0.3, 1.2)
  

