# Matrix
my.data <- 1:20
my.data
A <- matrix(my.data,4,5)
A
B <-matrix(my.data,4,5,byrow=T)
B

# rbind()
r1 <- c('I','am','happy')
r2 <- c('What','a','Day')
r3 <- c(1,2,3)
C <- rbind(r1,r2,r3)
C2 <- rbind(r3,r2,r1)
C2

# cbind()
c1 <- 1:5
c2 <- -1:-5
C3 <- cbind(c1,c2)
C3

# Selecting Rows and Columns by Name
Salary["JoeJohnson",'2005']

# Name Vectors
peter <- 1:5

#give a Name
names(peter) <- c('a','b','c','d','e')
peter['a']

#clear the Names of a vector
names(peter) <- NULL
peter

# Work with Dataset NBL
rownames(Games)
colnames(Games)
Games['KobeBryant','2008']

# Divide Operations 
round(FieldGoals / Games,1)
round(MinutesPlayed / Games) #Wieviele Spielminuten pro Game
round(Salary/Games) #Wieviel verdient pro Spiel
round(sum(Salary['KobeBryant',]/1000000)/11,1)

