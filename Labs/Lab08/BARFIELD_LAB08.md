# BARFIELD_Lab08 Metadata

This folder contains:
1. R script for the lab
2. A data file that has the results of a discrete-time logistic growth model

The model equation:
```
discrete-time logistic growth equation: n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
```
This model will show you how the population changes over `t` number of generations.

My function code:
```
growthModel <- function(r, K, t, nInit) {
n <- rep(nInit, t)
Time <- (1:t)
for (i in 2:t) {
n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K )
}
growthData <- cbind(Time, n)
plot(Time, n, xlab = "Time", ylab = "Abundance")
return(growthData)
}
```

The values in the data file are `growthModel(0.8, 10000, 12, 2500)` meaning the intrinsic growth rate is 0.8, the carrying capacity is 10000, the # of generations is 12, and the initial population is 2500. 

Find it [here](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Labs/Lab08/BARFIELD_Lab08.R)!

Look at the plot!

![Time v Abundance plot](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Labs/Lab08/plot.png)
