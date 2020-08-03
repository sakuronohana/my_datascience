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
?apply # hier mehr dazu

# Wollen wir dieses Beispiel mit Spalten machen dann, was in diesem Beispiel keinen Sinn macht
apply(Chicago,2,mean)

# Vergleichen wir nun mal den Mittelwert der verschiedenen Städte 
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)

# Zum Verleich wollen wir noch kurz eine andere Möglichkeit aufzeigen die ohne die Apply Function funktioniert.
# 1. Loop
output <- NULL # In einem Loop brauchen wir immer eine Platzhalter in welchem die zwischenresultate gespeichert werden können
for(i in 1:5){
  output[i] <- mean(Chicago[i,])
  
}
output
names(output) <- rownames(Chicago)
# Wir sehen am Beispiel oben, dass die Apply Funktion eine wesentliche Verbesserung gegenüber der Loop Möglichkeit darstellt.

# Kommen wir nun zur lapply Funktion. Mittels dieser Funktion können wir eine Apply Funktion über eine Liste oder Vector laufen lassen
# Nehmen wir mal an, dass wir eine Liste transponieren wollen, das machen wir wie folgt.
t(Chicago) # Die Zeilen werden Spalten

# Würden wir dies nun mit allen Elementen in der Liste wetter machen wollen, dann müssten wir normalerweise einen Loop kreieren
# Einfacher geht das aber mit lapply
lapply(wetter, t) # Zuerst geben wir die Liste und dann die Funktion mit

# Wir sehen alle Element bzw. Matrizen wurden entsprechenden transponiert. 
# Ein anderes Beispiel wäre das Einfügen einer neuen Zeile in einer Matrix was im Normalfall wie folgt gemacht wird.
rbind(Chicago, MonthNr=1:12)

# Mit lapply sieht das so aus:
lapply(wetter, rbind, MonthNr=1:12) # Voila! 

# Wir habe weiter oben mal mittels apply Function den Mean jeder Zeil in der Matrix Chicago. Wollen wir die nun über alle Elemente 
# in unserer Liste errechnen, dann können wir hierzug die Funktion rowMeans mit lapply verwenden.
lapply(wetter, rowMeans) # das war's schon :-)

# Übrigens gibt es neben rowMeans auch noch colMeans, rowSums, colSums
# Wir bleiben jetzt noch etwas bei lapply und zeigen mal auf, wie dies zusammen mit dem [] operator verwendet werden kann.
wetter[[1]][1,1] # Mittels diesem Operator greifen wir auf das erste Element, erste Reihen, erste Spalte zu.
lapply(wetter, '[', 1,1) # und so können wir das für die gesamte Liste 'Wetter' machen.
lapply(wetter, '[', ,1)

# Wir können natürlich die bestehenden Funktionen mit apply verwenden aber auch eigene Funktion erstellen
lapply(wetter, function(x) x[1,]) # Gibt jeweils die erste Zeile bzw. durchschnittliche Höchsttemperatur aus
lapply(wetter, function(x) x[5,]) # Gibt jeweils die fünfte Zeile bzw. Sonnenstunden aus
lapply(wetter, function(x) x[,12]) # Hier geben wir jeweils den Dezemberwert aus
# Nachfolgend etwas kompliziertere Beispiele. 
lapply(wetter, function(z) z[1,]-z[2,]) # Hier subtrahieren wir für jedes Element in der Liste jeweils die Tiefst- mit den Höchsttemperaturen
# In einer der Aufgaben oben wollen wir wissen um wieviele % die Temperaturen schwanken
lapply(wetter, function(z) round((z[1,]-z[2,])/z[2,],2)) 

# Kommen wir nun zu sapply. Die Funktion ist nichts anderes als eine Vereinfachung von lapply
# Im nachfolgenden Beispiel suchen wir die durchschnittliche Höchsttemperatur im Juli 
lapply(wetter, '[',1,7)
# Nun machen wir das Gleiche mit sapply
sapply(wetter, '[',1,7) # Wir sehen, dass sapply den Output in einem Vector mit Namen des Elements ablegt.
# Nachfolgend noch ein paar andere Beispiele
sapply(wetter,'[',1,10:12) # Avg. Höchsttemperaturen für das letzte Quartal
round(sapply(wetter, rowMeans),2)
