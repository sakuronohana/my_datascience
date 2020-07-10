# In diesem Tutor geht es um Listen in R. Listen sind starke Konstrukte,
# in welchen alle Arten von Strukturen Vektor, Matrixen usw. platziert werden können.

# Mittels des folgenden Datensatzes möchten wir mal die Auslastung von Maschinen in der Produktion analysieren
util <- read.csv('P3-Machine-Utilization.csv')
head(util)
str(util)
summary(util)

# Wir fügen mal eine zusätzliche Spalte hinzu mit der Differenz zur Idle-time
util$Utilization = 1 - util$Percent.Idle
