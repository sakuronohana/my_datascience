# Wir haben bereits die Matrixen kennengelernt. Ein DataFrame ist eigentlich das Gleiche
# mit dem grossen Unterschied, dass DataFrames vielerlei Datentypen beinhalten kann, was 
# eine Matrix nicht kann. Zudem ist die Selektion der Daten im DF einfacher


''' Methode 1: Mit dem nachfolgenden Befehl lassen wir uns ein Dialogfenster öffnen 
in welchen wir die Datei unserer Wahl auswählen können '''

stats <- read.csv(file.choose())

''' Methode 2: Wir wählen die Datei direkt mittels Befehl'''

getwd() # Zeigt aktuelle Workdir

# Das setzen des Workdir ist je nach OS anders

#Windows
setwd('C:\\Users\\ude4037\\AnacondaProjects')

#Mac
setwd('/Users/dili/Wissen/Work/DataScience/github_reps/my_datascience/udemy')

#Nun können die Daten import werden
rm(stats)
stats <- read.csv('P2-Demographic-Data.csv')

'''Exploring the Dataset - Kleine Wegleitung zur Vorgehensweise'''

# Anzeigen Zeilen (X)
nrow(stats)
# Imported 195

# Anzeigen Spalten (Y)
ncol(stats)
# Imported 5

# Kurze Übersicht der Merkmale
head(stats, n=5) # Zeigt erste 5 Zeilen
tail(stats, n=5) # zeigt letzte 5 Zeilen
str(stats) # Zeigt die Struktur (str) der Daten wie Merkmale und Datentyp
summary(stats) # Zeigt Boxplot informationen

# Using $ -> funktioniert nur bei Dataframes ... ein weitere Vorteil 
# Wir habe ja bereits folgende Möglichkeiten der Datenselektion gelernt
stats[3,3] 
stats[3,'Birth.rate']
stats['Angola',] # Das funktioniert natürlich nicht, da die Rows keine Namem haben

#Selektion mit $
stats$Internet.users #Aufruf ganzer Spalten
stats$Internet.users[2] # Aufruf des Werts in der 2 Zeile des Merkmals Internet Users
levels(stats$Income.Group) # Da wir wissen, dass R Factor erkannt hat können wir auch mit diesen Arbeiten

# Basic Operations mti Data Frames 
stats[1:10,] # gibt alle Zeilen von 1 bis 10 aus
stats[3:9,]
stats[c(4,100),]
