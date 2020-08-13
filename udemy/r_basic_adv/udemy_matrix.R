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

# Ab Lession 38 - Function

# Creating Functions in R

myplot <-function(data, rows=1:10){ #rows (mit Default-Wert 1:10) und data ist die Variable für die Auswahl der Spieler des Datensatzes
Data <- data[rows,,drop=F] # die Variable ist hier und 
matplot(t(Data), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset=0.01, legend=Players[rows],col=c(1:4,6),pch=15:18) #hier
}

myplot(Salary,3:2) # Hier wird die Variable genommen und in die Variablen der funktion übertragen

# Analyse der Basketball Daten

# Hier sehen wir den Lohn der Spieler
myplot(Salary)

# Hier wollen wir sehen wieviel ein Spieler pro Spiel verdient hat
myplot(Salary/Games) 
''' Wir sehen hier zwei Ausreiser bzw. die Spieler Kobe Bryant und Derrick Rose haben hier 
in einem speziellen Jahr pro Spiel viel verdient. Der Grund sehen wir, wenn wir uns den 
Datensatz Games ansehen
'''
Games
''' Kobe Bryant hat im 2013 sehr wenige Games gespielt und Derrick Rose im 2012/2013 ebenfalls.
Wenn nun also der Salary durch die wenige Spiele dividiert wird, ergibt es eine grosse Summe 
pro Spiel'''

# Bei der Analyse der gespielten Minuten zeigt sich das Bild erneut. 
myplot(MinutesPlayed)

# Das gleiche bei der Punktestatistik
myplot(Points)

''' Aus analtytischer Sicht besteht hier die Möglichkeit nur die Daten zu vergleichen, welche
ebenfalls von den Ausreissern betroffen sind, somit hebt sich das Problem wieder auf. '''
myplot(FieldGoals)
myplot(FieldGoals/FieldGoalAttempts)
'''In diesem Vergleich sehen wir, dass Dwight Howard im Vergleich zu seinen Goals viele Attempts hat.
Er hat also pro Goal viele Versuche bzw. seine Treffersicherheit ist nicht optimal'''

myplot(FieldGoalAttempts/Games)
'''Schauen wir uns jedoch den Vergleich zwischen den Attempts und den Spielen an, dann sehen 
wir Dwight an unterster Stelle'''


