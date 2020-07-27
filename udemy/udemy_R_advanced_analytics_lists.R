# In diesem Tutor geht es um Listen in R. Listen sind starke Konstrukte,
# in welchen alle Arten von Strukturen Vektor, Matrixen usw. platziert werden können.
setwd('/Users/dili/Wissen/Work/DataScience/github_reps/my_datascience/udemy')
getwd()
# Mittels des folgenden Datensatzes möchten wir mal die Auslastung von Maschinen in der Produktion analysieren
util <- read.csv('P3-Machine-Utilization.csv')
head(util, 12)
str(util)
summary(util)

# Wir fügen mal eine zusätzliche Spalte hinzu mit der Differenz zur Idle-time
util$Utilization = 1 - util$Percent.Idle

# Beim betachten der Daten stellen wir fest, dass unsere Daten noch die eine oder andere Unschönheit besitzt.
# Beim Datumsformat wissen wir noch nicht ganz, ob es ich um das europäische oder amerikanische Format handelt
tail(util, 12) # gehen wir ans Ende unserer Daten, dann stellen wir fest, das es sich um das europäische Format handelt

'''
Es kommt immer wieder vor, dass das Daten je nach verwendete Format, nicht auf alle Maschinen (UNIX/Windows/Mac) portiert 
werden können, was ziemlich ärgerlich ist. Hierzu gibt es in R eine praktikable Lösungs names POSIX (Portable Operating System Interface)
(https://de.wikipedia.org/wiki/Portable_Operating_System_Interface). Für die Handhabung von Date-Time Klassen kann die Funktion
POSIXct verwendet werden.
'''
util$PosixTime <- as.POSIXct(util$Timestamp, format='%d/%m/%Y %H:%M')
head(util, 12)

# Nun wollen wir einerseits die Spalte mit Timestamp löschen und die neue PosixTime nach vorne verschieben.
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)] # Nun überschreiben wir den Datensatz mit einer neuen Anordnung der Spalten
names(util)[names(util) == 'PosixTime'] <- 'Timestamp' # Nun ändern wir noch den Namen der Spalte

# Wie wir ja bereits wissen können wir verschiedene Datentypen in einer Liste zusammenführen.
RL1 <- util[util$Machine == 'RL1',]

# Nachfolgend werden wir nun eine Liste erstellen, in welcher minimum, mean und maximum der Nutzung der Maschine RL1 beinhaltet.
util_stats_rl1 <- c(min(RL1$Utilization, na.rm=TRUE),
                    mean(RL1$Utilization, na.rm=TRUE),
                    max(RL1$Utilization, na.rm=TRUE))

# Wir wollen nun herausfinden, ob die Nutzung der Maschine RL1 je unter 90% gefallen ist. Die einfachste Art und Weise ist wie folgt:
RL1$Utilization < 0.90 # Ausgabe nur TRUE oder FALSE
which(RL1$Utilization < 0.90) # Ausgabe die jeweilig Postion im Datensatz
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 1# und nun noch die Anzahl 
util_under_90_flag
list_rl1 <- list('RL1', util_stats_rl1, util_under_90_flag) # Aus den Resultaten erstellen wir nun eine Liste.
list_rl1 
