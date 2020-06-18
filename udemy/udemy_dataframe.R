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
is.data.frame(stats[1,])
is.data.frame(stats[,1]) # Wird nicht als DF angezeigt
is.data.frame(stats[,1,drop=F])

# Math Operations
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
sum(stats$Birth.rate) # summiert alle Gebutsraten über alle Länder
mean(stats$Birth.rate) # bildet Durchschnitt aller Geburtsraten pro Land

stats[3,'Birth.rate'] - stats[2,'Birth.rate'] # Kalkulation von einzelnen Werten

# Spalte hinzufügen
stats$mycalc <- stats$Birth.rate + stats$Internet.users # Fügt die Kalkulation in eine neue Spalte hinzu
head(stats)

# Löschen einer Spalte
stats$mycalc <- NULL

# --------- Filtering mit Data Frame
head(stats)
filter <- stats$Internet.users < 2 # Suche aller Werte unter 2%, Ouput TRUE/FALSE
stats[filter,] # mit dem Output von oben können wir nun alle Reihen ausfiltern die True haben

stats[stats$Birth.rate > 40,] # Das lässt sich natürlich auch noch vereinfachen
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == 'High income', ] # wir können natürlich auch kategorische Merkmale filtern

# Nachfolgend noch eine kleine Überprüfung der Korrelation zwischen Geburtsrate und Internetbenutzung
cor(stats$Internet.users,stats$Birth.rate)
scatter.smooth(stats$Internet.users,stats$Birth.rate)

# ------ Kurzeinführung in qplot (ggplot)
library(ggplot2)
qplot(data=stats, x=Internet.users) # Erstellt ein Distplot
qplot(data=stats, x=Income.Group, y=Birth.rate) # Erstellt ein Scatterplot
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3)) # Erstellt ebenfalls ein Scatterplot mit grösseren Punkten
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(2),color=I('blue')) # Wir fügen nun noch eine Farbe dazu
qplot(data=stats, x=Income.Group, y=Birth.rate, geom='boxplot') # Nun wollen wir eine bestimmten Plot erstellen

# ----- Data Science Visualisierung 
qplot(data=stats, x=Internet.users, y=Birth.rate) # Vergleich Anzahl Internet.users mit Geburtsrate
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2), color=('red'))
# Nachfolgend werden wir den Vergleich erneut tätigen. Dabei wird die Grösse der Punkte auf die Geburtsrate
# und die Farbe der Punkte nach Einkommensgruppe gestaltet.
qplot(data=stats, x=Internet.users, y=Birth.rate, size=Birth.rate, color=Income.Group)

# ----- Erstellen von Data Frames
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset) # Wir überführen nun diese 3 Vectors in ein Data Frame 
head(mydf)
colnames(mydf) <- c('Country','Code','Region') # Nun benennen wir noch die Spaltenname um

# Wir können das wie in R gewohnt natürlich wieder etwas einfacher haben und benennen die Spaltenname 
# direkt bei der Erstellung des DF 
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
