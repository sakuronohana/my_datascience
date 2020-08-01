'''
Wir kommen nun zur Kür. Wir lernen nun R Funktionen, welche mit minimalen Code maximale Wirkung erzielen.
Zu diese Zweck werden wir folgenden Aufgabenstellung lösen:

1.A table showing the annual averages of each observed metric for every city
2.A table showing by how much temperature fluctuates each month from min to max (in %). Take min temperature as the base
3.A table showing the annual maximums of each observed metric for every city
4.A table showing the annual minimums of each observed metric for every city
5.A table showing in which months the annual maximums of each metric were observed in every city (Advanced)

'''
setwd('./weather_data') # Das ist der einfachste und schnellste Weg den aktuellen Workpath um ein Verzeichnis zu erweitern.
getwd()

# Erstellen wir nun die Datensätze

Chicago <- read.csv('Chicago-C.csv', row.names =1) # Mir row.names definieren wir welche die Spaltenname sein sollen
NewYork <- read.csv('NewYork-C.csv', row.names =1) 
Houston <- read.csv('Houston-C.csv', row.names =1) 
SanFrancisco <- read.csv('SanFrancisco-C.csv', row.names =1) 

is.data.frame(Chicago) # Wir prüfen noch kurz ob es sich bei diesen Daten um ein DF handelt
# Wir konvertieren nun die Datensätze in Matrixen

Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

# Im nächsten Schritt werden wir alle Datensätze in einer Liste zusammenfassen:
wetter <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
wetter$Chicago[1,]

# Was ist jetzt eine Apply Function. Fangen wir doch einfach einmal mit einen Beispiel an
# Im folgenden Beispiel nehmen wir den Datensatz 'Chicago' und berechnen den arithm. Mittelwert pro Zeile
apply(Chicago,1,mean)
apply(Chicago,1,max) # Hier noch ein Beispiel mit max

# Wollen wir dieses Beispiel mit Spalten machen dann..
apply(Chicago,2,mean)

