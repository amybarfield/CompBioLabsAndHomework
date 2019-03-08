# Amy Barfield
# March 8, 2019

# Problem 3

#Recall code from Lab 4
#discrete-time logistic growth equation: n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
#n[t – 1] is the abundance of the population in the previous time step, 
K <- 10000 #K is the environmental carrying capacity for the population.
r <- 0.8 #r is the intrinsic growth rate of the population
time <- (1:12)
abundance <- rep(2500,12) #where abundance[t] is the abundance of the population at time t

for (t in 2:12) {
  abundance[t] <- abundance[t-1] + ( r * abundance[t-1] * (K - abundance[t-1])/K )
}

print(abundance)

#make plot of abundance vs time
plot(time,abundance)

# Turn the logistic growth model code into a function that takes r (the intrinsic growth rate), K (the carrying capacity), the total number of generations, and the initial population size as its arguments.

growthModel <- function(r, k, time, initAbundance)
  

