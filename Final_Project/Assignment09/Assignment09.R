# Final_Project_Assignment_9
# Amy Barfield
# Effects of herbicide chemicals on microbial communities

library("tidyverse")
setwd("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Final_Project")
data.fp <- file.path("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Final_Project")
# Load in data

Chatfield_percent_data <- read.csv("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Final_Project/Chatfield2_counts_%.csv")

## Goal 1: Create graphs to show %cover/time ##

Chatfield_percent_data <- read.csv("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Final_Project/Chatfield2_counts_%.csv")

# Average all 5 treatments for each date
unique(Chatfield_percent_data$date) #to see how many lines my table should be #7 unique dates, 5 treatments = 35

# Find means
cyano <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_Cyano = mean(X.cyano))
green <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_green = mean(X.green))
fungi <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_fungi = mean(X.fungi))
diatom <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_diatom = mean(X.diatom))
algae <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_algae = mean(X.algae))
moss <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_moss = mean(X.moss))
deadD <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_deadDiatom = mean(X.deadDiatom))
deadC <- summarise(group_by(Chatfield_percent_data, days_since_application, treatment), mean_deadCyano = mean(X.deadCyano))

# Create table of means
mean_data <- data.frame(cyano, green$mean_green, fungi$mean_fungi, diatom$mean_diatom, algae$mean_algae, moss$mean_moss, deadC$mean_deadCyano, deadD$mean_deadDiatom)
colnames(mean_data) <- c("days_since_application", "treatment", "cyano", "green", "fungi", "diatom", "algae", "moss", "deadC", "deadD")

# Option 1: Plot time vs mean for each species

# Cyanobacteria
#ggplot(mean_data) +
# geom_point(aes(x = days_since_application, y = cyano)) + 
#geom_line(aes(x = days_since_application, y = cyano)) +
#aes(color = treatment) +
#geom_vline(xintercept = 0, color = "red") +
#geom_text(aes(x= 4.2, label="<- treatment applied", y=30), color = "red") +
#ggtitle("Percent Cover over Time for Cyanobacteria") +
#labs(x = "Time (days)", y = "Cyanobacteria Growth (%)")

#geom_vline to add vert line (application)

# Green Growth
# ggplot(mean_data) +
# geom_point(aes(x = days_since_application, y = green)) +
# geom_line(aes(x = days_since_application, y = green)) +
# aes(color = treatment) +
# geom_vline(xintercept = 0, color = "red") +
# geom_text(aes(x= 4.2, label="<- treatment applied", y=10), color = "red") +
# ggtitle("Percent Cover over Time for Green Patches (unknown spp)") +
# labs(x = "Time (days)", y = "Green Patches (%)")

# Fungi
# ggplot(mean_data) +
#  geom_point(aes(x = days_since_application, y = fungi)) +
#  geom_line(aes(x = days_since_application, y = fungi)) +
#  aes(color = treatment) +
#  geom_vline(xintercept = 0, color = "red") +
#  geom_text(aes(x= 4.2, label="<- treatment applied", y=18), color = "red") +
#  ggtitle("Percent Cover over Time for Fungi") +
#  labs(x = "Time (days)", y = "Fungi (%)")

# Diatoms
#ggplot(mean_data) +
#geom_point(aes(x = days_since_application, y = diatom)) + 
#geom_line(aes(x = days_since_application, y = diatom)) +
#aes(color = treatment) +
#geom_vline(xintercept = 0, color = "red") +
#geom_text(aes(x= 4.2, label="<- treatment applied", y=40), color = "red") +
#ggtitle("Percent Cover over Time for Diatoms") +
#labs(x = "Time (days)", y = "Diatoms (%)")

# Algae
#ggplot(mean_data) +
# geom_point(aes(x = days_since_application, y = algae)) + 
#geom_line(aes(x = days_since_application, y = algae)) +
#aes(color = treatment) +
#geom_vline(xintercept = 0, color = "red") +
#geom_text(aes(x= 4.2, label="<- treatment applied", y=40), color = "red") +
#ggtitle("Percent Cover over Time for Algae") +
#labs(x = "Time (days)", y = "Algae (%)")

# Moss
#ggplot(mean_data) +
# geom_point(aes(x = days_since_application, y = moss)) + 
#geom_line(aes(x = days_since_application, y = moss)) +
#aes(color = treatment) +
#geom_vline(xintercept = 0)

# Dead Diatoms
#ggplot(mean_data) +
#  geom_point(aes(x = days_since_application, y = deadD)) + 
#  geom_line(aes(x = days_since_application, y = deadD)) +
#  aes(color = treatment) +
#  geom_vline(xintercept = 0)

# Dead Cyanobacteria
#ggplot(mean_data) +
#  geom_point(aes(x = days_since_application, y = deadC)) + 
#  geom_line(aes(x = days_since_application, y = deadC)) +
#  aes(color = treatment) +
#  geom_vline(xintercept = 0)

# Option 2: Make geom_smooth plots so you can get a visual of the data range (instead of individual plot points of means)

# Cyano
ggplot(Chatfield_percent_data) +
  geom_smooth(aes(x = days_since_application, y = X.cyano)) + 
  aes(color = treatment, fill = treatment) +
  geom_vline(xintercept = 0, color = "brown") +
  geom_text(aes(x= 2.5, label="<- treatment applied", y=30), color = "brown") +
  ggtitle("Percent Cover over Time for Cyanobacteria") +
  labs(x = "Time (days)", y = "Cyanobacteria Growth (%)") +
  theme(plot.title = element_text(hjust = 0.5)) 

# Green Growth
ggplot(Chatfield_percent_data) +
  geom_smooth(aes(x = days_since_application, y = X.green)) + 
  aes(color = treatment, fill = treatment) +
  geom_vline(xintercept = 0, color = "brown") +
  geom_text(aes(x= 2.5, label="<- treatment applied", y=10), color = "brown") +
  ggtitle("Percent Cover over Time for Green Patches (unknown spp)") +
  labs(x = "Time (days)", y = "Green Patches (%)") +
  theme(plot.title = element_text(hjust = 0.5)) 

# Fungi
ggplot(Chatfield_percent_data) +
  geom_smooth(aes(x = days_since_application, y = X.fungi)) + 
  aes(color = treatment, fill = treatment) +
  geom_vline(xintercept = 0, color = "brown") +
  geom_text(aes(x= 2.5, label="<- treatment applied", y=55), color = "brown") +
  ggtitle("Percent Cover over Time for Fungi") +
  labs(x = "Time (days)", y = "Fungi (%)") +
  theme(plot.title = element_text(hjust = 0.5)) 

# Diatoms
ggplot(Chatfield_percent_data) +
  geom_smooth(aes(x = days_since_application, y = X.diatom)) + 
  aes(color = treatment, fill = treatment) +
  geom_vline(xintercept = 0, color = "brown") +
  geom_text(aes(x= 2.5, label="<- treatment applied", y=40), color = "brown") +
  ggtitle("Percent Cover over Time for Diatoms") +
  labs(x = "Time (days)", y = "Diatoms (%)") +
  theme(plot.title = element_text(hjust = 0.5)) 

# Alternative: Plot multiple critters on one plot

# First, I need to rearrange my data
#get data into long form- gather()

new_data <- gather(mean_data, 'cyano', 'green', 'algae', 'diatom', 'fungi', 'moss', 'deadD', 'deadC', key = "Organism", value = "Mean")
# Subset it for the critters I'm interested in
new_data_subset <- subset(new_data, new_data$Organism == "cyano" | new_data$Organism == "green" | new_data$Organism == "diatom")
# ^ some phototrophs
new_data_dead <- subset(new_data, new_data$Organism == "deadD" | new_data$Organism == "deadC")
# ^ Dead critters

# Plot of phototrophs
#ggplot(new_data_subset) +
#  geom_point(aes(x = days_since_application, y = Mean)) +
#  geom_line(aes(x = days_since_application, y = Mean)) +
#  aes(color = treatment, linetype = Organism)

# Plot of dead critters
#ggplot(new_data_dead) +
#  geom_point(aes(x = days_since_application, y = Mean)) +
#  geom_line(aes(x = days_since_application, y = Mean)) +
#  aes(color = treatment, linetype = Organism)

# OR, facet wrap the more interesting plots
# Subset data
new_data_fw <- subset(new_data, new_data$Organism == "cyano" | new_data$Organism == "green" | new_data$Organism == "diatom" | new_data$Organism == "fungi")

pdf("Percent Cover Over Time.pdf")
ggplot(new_data_fw) +
  geom_point(aes(x = days_since_application, y = Mean)) +
  geom_line(aes(x = days_since_application, y = Mean)) +
  aes(color = treatment) +
  geom_vline(xintercept = 0, color = "brown") +
  geom_text(aes(x= 4.7, label="<- treatment applied", y=50), color = "brown") +
  facet_wrap(~Organism) +
  ggtitle("Percent Cover over Time for Microorganisms") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Time (days)", y = "Mean Percent Cover")

dev.off()

# Find the (average) growth rates for each organisms with each treatment
# I'm only going to focus on fungi, cyanobacteria, the green growth, and diatoms because they have the most data

# Transform table so Treatments become columns
gr2 <- spread(new_data_fw, treatment, Mean)
gr2$days_since_application <- gr2$days_since_application +2 #adding 2 so I don't have negative values later on

# Find the max mean value for each organism for each treatment

# Max
# Cyano
mC <- gr2[which(gr2$Organism == "cyano"),]

# Diatoms
mD <- gr2[which(gr2$Organism == "diatom"),]

# Fungi
mF <- gr2[which(gr2$Organism == "fungi"),]  

# Green
mG <- gr2[which(gr2$Organism == "green"),]  

mCDFG.df <- as.data.frame(rbind(mC[which.max(mC$agri),], mC[which.max(mC$ctrl),], mC[which.max(mC$glax),], mC[which.max(mC$gly),], mC[which.max(mC$prmx),],
                              mD[which.max(mD$agri),], mD[which.max(mD$ctrl),], mD[which.max(mD$glax),], mD[which.max(mD$gly),], mD[which.max(mD$prmx),],
                              mF[which.max(mF$agri),], mF[which.max(mF$ctrl),], mF[which.max(mF$glax),], mF[which.max(mF$gly),], mF[which.max(mF$prmx),],
                              mG[which.max(mG$agri),], mG[which.max(mG$ctrl),], mG[which.max(mG$glax),], mG[which.max(mG$gly),], mG[which.max(mG$prmx),]))

# Find the corresponding days
Func <- function(vector) {
  l <- vector[seq(1, length(vector), 5)]
  m <- vector[seq(2, length(vector), 5)]
  n <- vector[seq(3, length(vector), 5)]
  o <- vector[seq(4, length(vector), 5)]
  p <- vector[seq(5, length(vector), 5)]
  q <- c(l,m,n,o,p)
  return(q)
}

mCDFG.df
a <- mCDFG.df$days_since_application
b <- mCDFG.df$Organism
c <- mCDFG.df$agri
d <- mCDFG.df$ctrl
e <- mCDFG.df$glax
f <- mCDFG.df$gly
g <- mCDFG.df$prmx

z <- cbind(
Func(a),
Func(b),
Func(c),
Func(d),
Func(e),
Func(f),
Func(g)
)

colnames(z) <- c("days", "org", "agri", "ctrl", "glax", "gly", "prmx")

z <- as.data.frame(z)

# Create data frame to fill up with desired values
df <- setNames(data.frame(matrix(ncol = 7, nrow = 20)), c("Treatment", "Organism", "max", "maxDay", "min", "minDay", "GrowthRate")) #Create data frame, add column names
df$Organism <- z$org # organisms found usinf the function Func()
df$Treatment <- c(rep("agri", 4), rep("ctrl", 4), rep("glax", 4), rep("gly", 4), rep("prmx", 4)) # Create a vector to fill in the Treatment column
df$maxDay <- as.numeric(as.character((z$day)))
  
# To add the max values, I'm pulling from the table I created using the function Func()
# I know these are magic numbers
# I tried so so so so many different ways over so many days and I couldn't come up with a better solution
# The solution I came up with tht avoided magic numbers was much longer and more convoluded, I'd be happy to push that version of my script to prove that it was just not the better way. Let me know!
# I also realize that this version is messy and convoluded, but I seriously spent days trying to fid a better solution...
# I've burned thru so much PTO to work on this, but alas could not come up with a "cleaner" version. 
maxAgri <- as.vector(z[1:4,3])
maxCtrl <- as.vector(z[5:8,4])
maxGlax <- as.vector(z[9:12,5])
maxGly <- as.vector(z[13:16,6])
maxPrmx <- as.vector(z[17:20,7])
df$max <- as.numeric(c(maxAgri, maxCtrl, maxGlax, maxGly, maxPrmx))

# Fill in the rest of the table with the minimum values and corresponding days

# Looking at the ggplot "Percent Cover over Time for Microorganisms", I can see that some organisms don't start to grow until a few days into the experiment
# i.e Growth doesn't start at the beginning (aka 2 days before the treatment was applied) for all of the organisms
# For cyano, diatoms, and fungi, my starting value, aka minimum value, will be day 0 (really day -2, but I added 2 earlier so I wasn't dealing woth negatives here)
# For green, my starting value will be day 10 (really, day 8) because that's when growth really started

minCDF <- gr2[which(gr2$days_since_application == "0"),] #make df with all values for day 0
minCDF <- minCDF[-which(minCDF$Organism == "green"),] # get rid of "green"
minG <- gr2[which(gr2$days_since_application == "10"),] # pull the rows which correspond to day 10
minG <- minG[which(minG$Organism == "green"),] #pull out the row which has "green"

min.df <- as.data.frame(rbind(minCDF, minG)) #add the rows from the steps above together
# Now I have all of the min values and min days for each organism and each treatment

# Rearrange the data so I can grab it to put in the max.min.df columns
min <- gather(min.df, 'agri', 'ctrl', 'glax', 'gly', 'prmx', key = "Treatment", value = "Mean")

# Grab the min values and min days and put it in the df dataframe
df$min <- min$Mean
df$minDay <- as.numeric(min$days_since_application)  

df #wahoo it worked! so much code for such a little table
str(df)

# Calculate growth rates

# Write a function to calculate the growth rate.
# i.e. the slope of the line connecting the max and min values
# slope = (y2-y1)/(x2-x1)
slope <- function (a, b, c, d) {
  dy <- (a-b)
  dx <- (c-d)
  growthrate <- dy/dx
  return(growthrate)
}

# y = cover
# x = days

# Add the values from the table to the function I wrote above to find the growth rates of the organism
# I'm only calculating the growth rates to the maximum value because some of the organisms plateu after that
# I'm interested in knowing how fast they grew before leveling off (growth slowed) or decreasing (growth decreased)
# This will help give me a sense of how fast these organisms are able to grow in different conditions
# Comparing these values will help me assess how the different treatments affect the growth of the organisms via their growth rates

slope <- slope(df$max, df$min, df$maxDay, df$minDay)
df$GrowthRate <- as.numeric(slope) # add the growth rate values to the table

print(df) # all filled in!

# Create plot of the growth rates

# As segments, showing start growth to max growth (average)
pdf("segplot.pdf")
ggplot(max.min.df) +
  geom_segment(aes(xend = minDay, maxDay, yend = min, max)) +
  aes(color = Treatment) +
  facet_wrap(~Organism) +
  ggtitle("Maximum Growth For Each Organism") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Time (days)", y = "Mean Percent Cover")

dev.off()

# Another way to visualize
# Just looking at the growth rates and comparing each treatment 
pdf("Growthplot.pdf")
ggplot(max.min.df, aes(x = Treatment, y = GrowthRate)) +
  geom_bar(stat="identity", aes( color = Treatment)) +
  aes(fill = Treatment) +
  facet_wrap(~Organism) +
  ggtitle("Growth Rates to Max Growth of Each Treated Organism") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Treatments", y = "Growth Rates (∆ days/∆ max growth)")

dev.off()

# Maximum Growth
# Visualize the maximum percent growth for each species by each treatment

pdf("maxGrowth.pdf")
ggplot(max.min.df, aes(x = Treatment, y = max)) +
  geom_bar(stat="identity") +
  scale_fill_brewer("Blues") +
  aes(fill = Treatment) +
  facet_wrap(~Organism) +
  ggtitle("Maximum Growth for Each Organism") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Treatments", y = "Max % Cover")

dev.off()
# What it's basically showing is that for all organisms except for fungi, the non adjuvant treatments were able to reach a much higher max growth.

# AND THAT'S ALL, FOLKS!

