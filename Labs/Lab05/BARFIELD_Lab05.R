##Part I##

#Step 1
#Create a variable named x and assign a numeric value of your choosing to it
#then write an if-else statement that checks if the value is larger than 5

x <- 3
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is less than 5")
}

#Step 2
#read in file
Vector1.csv <- read.csv("/Users/amybarfield/Grad_School/CompBio_Sp2019/compBioSandbox/CompBio_on_git/Labs/Lab05/Vector1.csv")
Vector1 <- Vector1.csv$x

#2a write for loop to replace negative values with NA

for (i in 1:length(Vector1) ) {
  if (Vector1[i] < 0) {
    Vector1[i] <- NA
  }
}

#2b use logical indexing to replace all those NA values with NaN

NewVec <- which(is.na(Vector1))
Vector1[NewVec] <- NaN

#2c Using a which() statement and integer indexing, replace all those NaN values with a zero

NewVec_2 <- which(is.nan(Vector1))
Vector1[NewVec_2] <- 0

#2d Use code to determine how many of the values from the imported data fall in the range between 50 and 100 
Vec_50_100 <- which(Vector1 >= 50 & Vector1 <= 100)
length(Vec_50_100) #vector length is 498

#2e create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100
FiftyToOneHundred <- Vector1[Vec_50_100]

#2f save your vector to a file named "FiftyToOneHundred.csv"
  # first, change working working directory
setwd("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Labs/Lab05/")

write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#Step 3
# Import the data on CO2 emissions
CO2_data_cut_paste <- read.csv("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Labs/Lab04/CO2_data_cut_paste.csv")

#3a write code to figure out what was the first year the "Gas" emissions were non-zero?
Gas_emissions <- which(CO2_data_cut_paste$Gas > 0) 
Gas_emissions #vector starts at 135
CO2_data_cut_paste$Year[135] 
#answer:1885

#3b write code to figure out which years were "Total" emissions between 200 and 300 million metric tons of carbon?
Total_emissions <- which(CO2_data_cut_paste$Total >= 200 & CO2_data_cut_paste$Total <= 300)
CO2_data_cut_paste$Year[Total_emissions]
#answer: 1879 1880 1881 1882 1883 1884 1885 1886 1887

##Part II##

#"Lotka-Volterra" predator-prey model
#n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
#p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])

# First, set up parameter values
totalGenerations <- 1000
initPrey <- 100 #initial prey abundance at time t=1
initPred <- 10 #initial predator abundance at time t=1
a <- 0.01 #attack rate
r <- 0.2 #growth rate of prey
m <- 0.05 #mortality rate of predators
k <- 0.1 #conversion constant of prey into predators

#Second, create a time vector and 2 additional vectors to store results
  # one for values of n over time
  # one to store values of p
time <- seq (1, totalGenerations)
n <- rep(initPrey, totalGenerations)
p <- rep(initPred, totalGenerations)

#Third, write a loop that implements these calculations
#Fourth, add if statements to make negative values 0

for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])

  if (n[t] < 0) {
    n[t] <- 0
  }
  
  if (p[t] < 0) {
    p[t] <- 0
  }
}

#Fifth, make a plot of abundances of pred and prey over time
plot(time, n, xlab = "Time", ylab = "Abundance", type = "l", col="red") #make plot of predator abundance
lines(time, p, col="blue") #add line of prey abundance
legend("topright", legend = c("Prey", "Predators"), col = c("blue", "red"), lty = 1) #add legend for flare

#Sixth, create a matrix of your results, save as .csv
  #named "myResults" 
  #first column is named "TimeStep"
  #the second column is named "PreyAbundance"
  #third column is named "PredatorAbundance"

myResults <- cbind(time, n, p) #make matrix
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance") #change column names

setwd("/Users/amybarfield/Grad_School/CompBio_Sp2019/CompBioLabsAndHomework/Labs/Lab05/") #change working directory
write.csv(x = myResults, file = "PredPreyResults.csv") #write .csv

