# Vektoren

vect <- c(1,3,5,6,77,88,99)
is.numeric(vect)
is.integer(vect)
is.double(vect)

vect2 <- c(3L,12L,24L)
is.integer(vect2)

vect3 <- c('Hello',7)
is.character(vect3)
is.numeric(vect3)

seq() #Sequence
rep() #replication

seq(1,50) # zählt von 1 - 50
z <-seq(1,50,3) # zählt von 1 - 50 in 3 Schritten
z

r <-rep(3,50) # repliziert die Nummer 3 50mal
r

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


  