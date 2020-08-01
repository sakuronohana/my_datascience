'''
Wir kommen nun zur Kür. Wir lernen nun R Funktionen, welche mit minimalen Code maximale Wirkung erzielen.
Zudem werden wir folgenden Aufgabenstellung lösen:

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
