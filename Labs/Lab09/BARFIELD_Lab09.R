# Amy Barfield
# March 15, 2019

#Prelim Step: Import data

setwd("/Users/amybarfield/Grad_School/CompBio_Sp2019/compBioSandbox/CompBio_on_git/exampleData/Cusack_et_al/")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

## PROBLEM 1 ##
# convert dates and times into actual objects that represent time rather than just being character strings

# Try out a small piece of data first

smallVec <- camData$DateTime[1:5]

strptime(smallVec, format = '%d/%m/%Y %H:%M')

# Now do it for whole data set

strptime(camData$DateTime, format = '%d/%m/%Y %H:%M')


## PROBLEM 2 ##
# figure out which dates were NOT coverted properly by your method from problem 1

twoDigVec <- as.Date(camData$DateTime, format = '%d/%m/%y %H:%M')
fourDigVec <- which(is.na(twoDigVec)) #length is 8959!

# How many were not converted properly?
length(twoDigVec) - length(fourDigVec)
# answer? 5645!    

## PROBLEM 3 ##
# use your methods from problems 1 and 2 to create an ACCURATE vector of dates and times

convertVec <- which(twoDigVec > 0) #twoDigVec included all values in camData$DateTime so this new vector will just show the values that I want to work with

new2DigVec <- twoDigVec[convertVec] #to work with the dates and not just the index
length(new2DigVec) #just making sure that it worked, it did!

new2DigVec <- as.Date(twoDigVec[convertVec], format = '%d/%m/%Y %H:%M')
# now I have a vector of correct dates, but I can't put it back in the original vector because they lost their index values
# argggghhh

#ok trying a loop

for (i in length(camData$DateTime)) {
    if as.Date(camData$DateTime, format = '%d/%m/%y %H:%M') {
      format.Date(x = camData$DateTime, as.Date(camData$DateTime, format = '%d/%m/%Y %H:%M'))
    } 
  
  # class is ending and I have a nephew to meet
  # my nephew is a golden retriever puppy
    
  } 
}
