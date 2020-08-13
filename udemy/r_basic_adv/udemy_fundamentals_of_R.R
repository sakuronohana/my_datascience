# Vektoren

vect <- c(1,3,5,6,77,88,99) # c bedeutet Combine

# Welcher Datentype haben wir?
is.numeric(vect)
is.integer(vect)
is.double(vect)
typeof(vect)

vect2 <- c(3L,12L,24L)
is.integer(vect2)

vect3 <- c('Hello',7)
is.character(vect3)
is.numeric(vect3)

seq() #Sequence
rep() #replication

seq(1,50) # zählt von 1 - 50
z <-seq(1,50,3) # zählt von 1 - 50 in 3 Schritten
# Im R können wir den Attributen auch Namen geben was die Funktion noch verständlicher macht
seq(from=10, to=20, length.out = 100 )

rep(3:6, each=50) # repliziert die Nummer 3 50mal
?rep
vectrep <- c(4,50)
rep(vectrep,20) # Replikation lässt sich auch mit Vektoren machen

# Brackets [] verwenden
x <-c('a','b','c','d','e','f')
x
# Um nun die einzelnen Elemente aufzurufen verwendet man eckige Klammern
x[1] # Einzelne Elemente aufrufen
x[-1] # Alle Elemente ausser das erste
var <-x[-1] # Alle Elemente ausser a in Variable
x[1:4] # Erste 4 Elemente darstellen 
vect[c(1,3,5)]

# Operationen mit Vectoren
v1 <-c(50,34,111,7,24,631,20,4,7,21)
v2 <-c(100,20,56,12,0,65,93,10,244,1)
v3 <-c(50,34,111,7,24)

#Um die einzelen Elemente in R zusammenzurechnen braucht es keinen Loop
v1+v2 #Addition
v1-v2 #Subtraktion
v1*v2 #Multiplikation
v1>v2 #Boolean 
v1<v2 #Boolean

# Funktioniert auch bei ungleichen Vektoren
# R wiederholt einfach den kleineren Vektor
v1+v3

# Wir erstellen nun einen Random Vektor von 5 Zahlen
x <- rnorm(5)
# Typischer R-Loop
for(i in x){
  print(i)
}

# Hilfestellung 
?rnorm
  
# Wie funktionieren Funktionen in R?
x = rnorm(n=5, mean=1000, sd=8)

# Wurzel im R
x <- c(3,2,5,6,8)
sqrt(x)

# Packages in R sind Bibliotheken von Funktionen, Beispielsdaten und kompilierter Code
# In RStudio können die Packages einfach auf der rechten Seite "Packages" verwaltet werden
# Achtung: Ein Package ist keine Library. Eine Library ist eine Funkton
# zur Aktivierung eines Packages

install.packages('plotly')
?diamonds
library(ggplot2)
library(gplots)
library(cars)
?cars
cars
qplot(data=cars, speed,dist, color=speed)


