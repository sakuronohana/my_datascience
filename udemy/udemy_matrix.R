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
sum(Points['KobeBryant','2008'])

# Divide Operations 
round(FieldGoals / Games,1)
round(MinutesPlayed / Games) #Wieviele Spielminuten pro Game
round(Salary/Games) #Wieviel verdient pro Spiel
round(sum(Salary['KobeBryant',]/1000000)/11,1)

# Visualisierung mit Matplot
# Wir wollen nun die FieldGoal Statistik pro Spieler ploten. Wir müssen jedoch dafür sorgen, 
# dass die Spieler jeweils pro Spalte aufgeführt werden. d.h. wir müssen die Matxi tranformieren (transpose)
# Das ist in R relative Einfach zu bewerkstelligen.
# Das folgende Sample wird mit matplot geplotet aber matplot ist nicht das präferenzierte Tool für Plotting in R
matplot(t(FieldGoals), type='b', pch = 15:18, col=c(1:4,6))
matplot(t(FieldGoals/Games), type='b', pch = 15:18, col=c(1:4,6)) # Hier ploten wir die Goals pro Games
matplot(t(FieldGoals/FieldGoalAttempts), type='b', pch = 15:18, col=c(1:4,6)) # Schauen wir uns mal die Accuracy der Spiel an
matplot(t(Points/Games), type='b', pch = 15:18, col=c(1:4,6)) # Schauen wir uns mal an wieviel Dollar jeder pro Punkt verdient hat
legend('bottomleft', inset=0.01, legend=Players, col=c(1:4,6), pch=15:18,horiz=F)

# Subsetting
x <- c('a', 'b','c','d','e') #Vector
x[c(1,5)] #Subsetting a Vector
x[c(1)]
Games[1:3,6:10] # Subsetting a Matrix first 3 Player from 2010 - 2013
Games[c(1,10),] # Subsetting: 1 and 10 Player
Games[,c('2008','2010')] # Subsetting mit ColNames
Games[c('JoeJohnson',"ChrisPaul"),c('2008','2013')]
# Bis jetzt hat das Subsetting immer eine Matrix ausgespuckt
# aber das ist nicht immer der Fall:
Games[1,] # Der Output zeigt uns keine RowName an
is.matrix((Games[1,])) # Findes wir nun noch etwa genauer heraus
is.vector(Games[1,]) # Es ist also ein Vektor
# Dieses Verhalten hat mit der Art und Weise zu tun wie wir die Auswahl treffen
# Die Lösung für diese Problem sieht wie folgt aus:
Games[1,,drop=F]
is.matrix(Games[1,,drop=F]) #mit dem drop verwirft R die Dimensionen und macht daraus eine Matrix

#Visualisierung von Subsets
Data <- MinutesPlayed[1:3,]
matplot(t(Data), type='b', pch = 15:18, col=c(1:4,6)) # Schauen wir uns mal an wieviel Dollar jeder pro Punkt verdient hat
legend('bottomleft', inset=0.01, legend=Players[1:3], col=c(1:4,6), pch=15:18,horiz=F)



