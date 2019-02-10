##Part I##

#Step 1
#Write "for loop" that prints hi 10x

for (i in seq(1,10) ) {
  print("hi")
}

#Step 2
#Write "for loop" to determine how much money Tim will have in 8 weeks
cash <- 10 #Tim's starting money
allowance <- 5 #amount of money Tim gets weekly
gum <- 2*1.34 #cost of 2 packs of gum
time <- (1:8) #weeks

for (i in seq(time)) {
  cash <- cash + allowance - gum
  print(cash)
}

#Step 3
#Population of 2000 shrinks by 5% every year 
pop_init <- 2000 #starting population
shrink_rate <- 0.05
numtime <- (1:7) #number of years

for (i in seq(numtime)) {
  pop_init <- pop_init - (pop_init * shrink_rate)
  print(pop_init)
}

#Step 4
#discrete-time logistic growth equation
# n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
#where n[t] is the abundance of the population at time t, 
#n[t – 1] is the abundance of the population in the previous time step, 
#r is the intrinsic growth rate of the population, and 
#K is the environmental carrying capacity for the population.
K <- 10000
r <- 0.8
t <- 1
n <- rep(2500,12)

for (t in 2:12) {
  n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
}

print(n)

##Part II##

#Step 5
#5a make a vector of 18 0s
vector <- rep(0,18)

#5b make a vector where it s 3 to the ith
for (i in seq(1,18)) {
  vector[i] <- 3 * i
}
vector

#5c
# make new vector of 0s but the first digit is 1
vector_new <- rep(0,18)
vector_new[1] <- 1
vector_new

#5d wr"ite a "for loop" so that starting with the second entry of the vector created in part c, the value stored in that position in the vector is equal to one plus twice the value of the previous entry
for (i in seq(2,18)) {
  vector_new[i] <- 1 + (2 * vector_new[i-1])
}
vector_new

#Step 6
# Write a loop to create the first 20 numbers of a Fibonacci sequence
fibo <- rep(0,20) #create vector, mamake the first number 0
fibo[2] <- 1 #change second number in sequence to 1
for (i in seq(2,20)) {
  fibo[i+1] <- (fibo[i] + fibo[i-1])
}
fibo

#Step 7
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
quartz()
plot(time,abundance)
