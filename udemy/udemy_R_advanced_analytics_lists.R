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

# Wir befassen uns im Zusammenhang mit den Listen auch mit dem Naming der einzelnen Elemente innerhalb
# der Liste

names(list_rl1) # Wie wir sehen können sind die Elemente in der Liste noch nicht benannt
names(list_rl1) <- c('Machine','Stats','LowThreshold')

# Wir können natürlich auch bereits bei der Erstellung der Liste einen Namen vergeben
list_rl1 <- list(Machine='RL1', Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1['Machine'] # Der Zugriff auf die einzelnen Element gestaltet sich mit Namen schon etwas einfacher

#Schauen wir uns nun einmal an wie wir verschiedene Komponenten aus einer Liste aufrufen können
#Es gibt 3 verschiedene Arten, wie wir Informationen aus einer Liste aufrufen können:
# [] - Mit den eckigen Klammern rufen wir immer eine Liste inkl. Name auf. Der Aufruf funktioniert im Index stil
list_rl1[1]

#[[]] - Mit den doppelten eckigen Klammern rufen wir nur das aktuelle Element auf
list_rl1[[1]]

#$ - Funktoniert gleich wie doppelte eckige Klammern ist aber etwas eleganter in der Anwendung
list_rl1$Stats[2]

# Nun da wir wissen, wie wir auf die einzelnen Elemente zugreifen können, wollen wir uns mal ansehen
# wie wir diese mutierene können.

