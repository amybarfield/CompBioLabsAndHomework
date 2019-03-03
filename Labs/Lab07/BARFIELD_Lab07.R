# Amy Barfield
# March 1, 2019

## Problem #1 ##

# Write a function to calculate the area of a triangle 
# 0.5 * base * height

triangleArea <- function(b, h) {
  # base, b, and height, h, must be given
  # multiply b and h together
  # multipy that by 0.5
  triangleArea <- b * h * 0.5
  return(triangleArea)
}

# Deomstrate it works by calculating the area of a triangle with base 10 and height 9
triangleArea(10, 9)

## Problem #2 ##

# Write a function to find absolute values

myAbs <- function(value) {
  for (i in 1:length(value)) {
    if (value[i] < 0) 
      value[i] <- (value[i] * -1)
  }    
    return(value)    
}

# Check to see if it works 
#1 with 5
myAbs(5)

#2 with -2.3
myAbs(-2.3)

#3 with vector c(1.1, 2, 0, -4.3, 9, -12)
myVec <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(myVec)

## Problem #3 ##

# Write a function that returns a vector of the first n Fibo #s
  # Where n is any integer >=3

# My Fibonacci sequence loop from lab 4:
#fibo <- rep(0,20) #create vector, mamake the first number 0
#fibo[2] <- 1 #change second number in sequence to 1
#for (i in seq(2,20)) {
  #fibo[i+1] <- (fibo[i] + fibo[i-1])
#}
#fibo

FibFun <- function( n, s) {
  fibSeq <- rep( 1, n ) #creates a vector of n length consisting of 1's
  fibSeq[1] <- s #allows you to declare the starting number (s)
  for (i in seq(3,n)) { #starts at 3rd position, goes to length n
    fibSeq[i] <- (fibSeq[i-1] + fibSeq[i-2]) #fib seq
  }
  return(fibSeq)
}

# Check to make sure it works
FibFun(13, 0) # length 13, start with 0
FibFun(10, 1) #length 10, start with 1
FibFun(3, 0) #making sure it works with length 3
FibFun(2, 1) #gets error message! Success I think...

## Problem #4 ##

#4a Write a function that takes two numbers as its arguments and returns the square of the difference between them

diffSqFunc <- function( x, y ) {
  myDiff <- (x-y) #first, find difference between x and y
  mySquare <- (myDiff)^2 #square
  return(mySquare)
}

# Demonstrate that it works...
# by calling it with #s 3 and 5
diffSqFunc(3,5) 
# returns 4

# by calling it with vector c(2, 4, 6) and 4
diffSqFunc(c(2, 4, 6), 4) 
#returns 4 0 4

# works!

#4b write a function that takes the average of a vector of numbers
# hint: do not use mean(), use sum()

vectorAvg <- function( myVector ) {
  mySum <- sum(myVector) #first add all the numbers in vector together
  vectorAvg <- mySum/length(myVector)
  return(vectorAvg)
}

# Demonstrate that it works...
# by calling it with vector c(5, 15, 10)
vectorAvg(c(5, 15, 10))
# returns 10

# by calling it with data in "DataForLab07.csv" file
# first, import data
DataForLab07.csv <- read.csv("/Users/amybarfield/Grad_School/CompBio_Sp2019/compBioSandbox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")

# next, turn data frame into vector
View(DataForLab07.csv)
lab07DataVec <- DataForLab07.csv$x

# next, test out function
vectorAvg(lab07DataVec)
# returns 108.9457 #success

#4c write a function to calculate a "sum of squares"
# Use the functions from before in this function

sumofSquares <- function( myData ) {
  # first calculate the mean (average of numbers)
  myMean <- vectorAvg( myData )
  # then, for each data point, the mean is subtracted from the data point
  # square the difference
  myDataPoints <- diffSqFunc( myData, myMean )
  # sum all the square differences 
  mySum <- sum(myDataPoints)
  return(mySum)
}

# Demonstrate that your sum of squares function works by calling it with the data provided in the file "DataForLab07.csv"
sumofSquares(lab07DataVec)
# returns 179442.4! yay!
