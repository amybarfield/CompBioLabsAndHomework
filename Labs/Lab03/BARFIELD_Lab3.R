##Part I##

#lab step #3
#Make variables for #guests ("Nerds") and #bags of chips ("Chips")
Chips <- 5
Nerds <- 8

#lab step #5
#how much the nerds will consume
Eat <- 0.4 * Nerds 

#lab step 7
#Expected amount of leftover chips
Leftovers <- ((Chips-Eat)-0.4) 

##Part II##

#lab step #8
#making vectors for the nerds' ranking of the movies
#Side note, Lenny is a tool
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9
#assign Lenny and Penny's rankings of episode IV to a variable
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#lab step #10
#concatenate nerds' ranking vectors to create a table of nerds' opinions (AKA Lenny's incorrect opinions)
Star_Wars_Ranks <- cbind(Self, Penny, Jenny, Lenny, Stewie)

#lab step #11
#Look at what you've done
str(PennyIV)
str(Penny)
str(Star_Wars_Ranks)
#PennyIV is a number, Penny is a vector, and Star_Wars_Ranks is a matrix of numbers

#Lab step #12
#make the Star_Wars_Ranks matrix a "data frame" 
Star_Wars_Ranks_DF <- as.data.frame(Star_Wars_Ranks)
#or
Star_Wars_Ranks_DF <- data.frame(Star_Wars_Ranks)

#Lab step #13
#Look at what you've done!
dim(Star_Wars_Ranks)
dim(Star_Wars_Ranks_DF)
#the results are the same
str(Star_Wars_Ranks)
str(Star_Wars_Ranks_DF)
#the first one gave me dimensions and the second one "printed" the table in the console
#SMF: note also the first is type "num", but teh second is seen as a collection of variables
Star_Wars_Ranks == Star_Wars_Ranks_DF
#the values of the two tables are equal, 
  #the result of this function showed a table of TRUE/FALSE where any dissimilarities would be labeled FALSE 
  #but since it was all the same values, it was just a table of "TRUE"s
typeof(Star_Wars_Ranks)
typeof(Star_Wars_Ranks_DF)
#the result of the first one was "double" and the result of the second one was "list" which TBH I'm not sure what those mean
# SMF: "double" means it is numeric; "list" means it is a collection of objects
all(Star_Wars_Ranks == Star_Wars_Ranks_DF)
#these objects are totally equal in their data content

#lab step #14
#make vector of episode names
Episodes <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step #15
#change row names of Star_Wars_Ranks and Star_Wars_Ranks_DF to episode names
row.names(Star_Wars_Ranks) <- Episodes
row.names(Star_Wars_Ranks_DF) <- Episodes

#lab step #16
#access third row of Star_Wars_Ranks
Star_Wars_Ranks[3,]

#lab step #17
#access 4th column of Star_Wars_Ranks_Df (AKA look at how much of a tool Lenny is)
Star_Wars_Ranks_DF[,4]

#lab step #18
#look at how I ranked Episode V
Star_Wars_Ranks[5,1]

#lab step #19
#look at Penny's ranking of Ep. II
Star_Wars_Ranks[2,2]

#lab step #20
#look at how the nerds rated the movies we watched together
Star_Wars_Ranks[4:6, ]

#lab step #21
#Look at the nerds' rankings of II, V, VII
Star_Wars_Ranks[c(2,5,7), ]

#lab step #22
#look at some of the nerds' opinions on certain movies
Star_Wars_Ranks[c(4,6),c(2,3,5)]

#lab step #23
#switch Lenny's dumb rankings for Ep.II and Ep. V
#create swap variable
Star_Wars_Ranks[2,4] #is 7
x <- Star_Wars_Ranks[2,4] 
#swap the values
Star_Wars_Ranks[2,4] <- Star_Wars_Ranks[5,4]
Star_Wars_Ranks[5,4] <- x

#lab step #24
#look at some rankings using row/column names instead of matrix values
Star_Wars_Ranks["III","Penny"]
Star_Wars_Ranks_DF["IV","Self"]

#lab step #25
#undo step 23 using row/column names instead of matrix values
#create swap variable
Star_Wars_Ranks["II","Lenny"] #is 6
y <- Star_Wars_Ranks["II","Lenny"]
#swap
Star_Wars_Ranks["II","Lenny"] <- Star_Wars_Ranks["V","Lenny"]
Star_Wars_Ranks["V","Lenny"] <- y

#Lab step #26
#use the $ to redo step #23
#assign swap variable
x <- Star_Wars_Ranks_DF$Lenny[2]
Star_Wars_Ranks_DF$Lenny[2] <- Star_Wars_Ranks_DF$Lenny[5]
Star_Wars_Ranks_DF$Lenny[5] <- x

