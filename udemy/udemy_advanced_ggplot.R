''' 
In diesem Tutorial werden wir uns überwiegend mit der Visualisierung befassen. Wenn es um die Visualisierung 
im R geht, dann kommt man an GGPlot nicht vorbei.
Eine Plot besteht im Idealfall aus folgenden Komponenten:
1. Data (Dataframe)
2. Aesthetics, Ein Set von Verknüpfungen zwischen Variablen in den Daten und visuellen Eigenschaften (aesthetics)
3. Geometries ist ein geometrisches Layer-Objekt das beschreibt, wie jeder Datenpunkt gerendert (aufbereitet, wiedergegeben) wird
4. Statistik bzw. statistische Verfahren
5. Facets, sind verschiedenen Plots in einem Graph
6. Koordinaten, sind die Daten auf einer x/y Achse
7. Theme, sind Titel, x/y Achstenbezeichnung etc
'''
#----- Data
'''
Beim nachfolgenden Datensatz handet es sich um eine sogenannte Rotten Tomatoes Film-Bewertung. In diese Datensatz befinden sich Zuschauer und Kritiker (Medien) 
Bewertungen. Es werden nur positive Bewertungen gemessen, d.h. ist eine Movie von weniger als 60% der Zuschauer oder Kritiker als positiv bewertet worden, dann
gilt der Film als "verfault", zwischen 60 und 70% gilt er als "frisch" und ab 75% gilt er als "garantiert frisch".
'''
movies <- read.csv('P2-Movie-Ratings.csv')
head(movies)
# Nachfolgenden werden wir noch die Spaltennamen anpassen.
colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating', 'BudgetMillions', 'Year')

# Was sind Factors
# Faktoren ist die Art wie R mit kategorsichen Merkmalen (Features) umgeht. Findet R eine solches Feature,
# dann weisst R jedem Kat. Feature eine Nummer zu. Im Rahmen der Datenanalyse werden diese Faktoren aber nicht 
# benötigt. Es handelt sich hier nur um die Art wie R mit kat. Features umgeht. Ob und wie R ein solches Feature findet bzw. benennt
# sieht man, mit folgender Funktion:

str(movies) # R hat zwei kat. Features gefunden und nummeriert.

summary(movies) 
# Im Output von summary sehen wir, dass für Year ein nummerisches Features definiert ist. Im Normalfall
# benötigen wir Jahreszahlen nicht zur Berechnung und machen daraus ein kategorische Feature.

movies$Year <- factor(movies$Year) # Die Konvertierung von nummerische in kategorsiche Werte kann einfach mit der Factor Funktion gemacht werden.
str(movies) # Nun sehen wir im Output, dass Year nun ein kat. Feature ist

#------ Aesthetic
# Wir werden nun mit ggplot arbeiten. qplot ist zur Erstellung von einfacheren Grafiken gedacht, 
# während man mit ggplot komplexere Plots darstellen kann. Oft genügt zur schnellen Erstellung eines Plots 
# Auch die qplot Funktion
library(ggplot2)

# Aestetic hinzufügen
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) # aes steht für Aesthetic. Beim Ausführen dieser Codezeile passiert aber noch nicht viel!

# Geometrik hinzufügen
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point() # Es wird lediglich noch das geometrische Element benötigt und dann funktioniert es auch

# Farben und Grösse hinzufügen -> gehört zu Ästhetik
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) +
  geom_point()

#---------- Plotting mit Schichten (Layers
# Mit dem + Zeichen fügen wir verschiede Objekte hinzu. Nachfolgend ein kleines Beispiel

grafik <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

# Nachdem wir für den ästhetischen Teil in ein eigenes Objekt erstellt haben können wir einfach andere Objects hinzufügen
grafik + geom_point()
grafik + geom_line()
grafik + geom_point() + geom_line()

#-------- Überschreiben von Aesthetics
# Nehmen wir mal an, wie bauen eine ästhetischen Basic-Layer oder auch Template und wollen es in verschiedenen Plots
# verwenden, wollen aber trotzdem die Freiheit haben mal etwas am Template zu verändern ohne das Template selbst zu verändern.
# Nichts einfacher als das :-)
grafik + geom_point(aes(size=CriticRating, color=BudgetMillions))

# Es lassen sich auch x und y überschreiben aber Achtung das Label der Achsen bleibt gleich. Das kann man aber einfach mit xlab oder ylab 
# korrigieren.
grafik + geom_point(aes(x=BudgetMillions)) + xlab('Budget Millions')

# und jetzt das Ganze noch mit kompinierten geometischen Objekten
grafik + geom_line(size=1) + geom_point()

#----- Mapping und Setting
# Es gibt zwei wesentliche Arten wie man bspw. eine Farbe in einem ggplot hinzufügt.
grafik <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating))

# Was wir ja bereits kennen ist das Mapping. Beim Mapping verbinden wir ein Merkmal mit einer Plot-Eigenschaft
# bspw. Color und BudgetMillions
grafik + geom_point(aes(color=Genre))
grafik + geom_point(aes(size=BudgetMillions))

# Beim Setting setzen wir lediglich ein Eigenschaft auf ein Element
grafik + geom_point(color='green')
grafik + geom_point(size=4)

#----- Histograms und Density Charts
# Wenn es darum geht zu prüfen, ob ein Datensatz einer Normalverteilung folgt, dann ist ein Histogramm der beste Plot dafür
# Im nachfolgenden Beispiel wird auf der X-Achse der Wert 0 - 300 Millionen (USD) und auf der Y-Achse die Anzahl Movies welche
# welche eine bestimmtes Millionen Budget verbraucht hat.
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

# Wollen wir noch etwas Farbe hinzufügen, dann benutzen wir das Attribut "fill". Das Attribut "color" bedeutet in diesem
# Fall nur die Umrandung
s + geom_histogram(binwidth =10, aes(fill=Genre), color='Black')

# Mittels eine Density Plots können aufzeigen wo die Dichte am höchsten ist.
s + geom_density(aes(fill=Genre), position='stack') # mittels position stack können wir die Schichten besser erkennen

#---------- Tips für Layering
# Der Weg ist zum Plot ist abhängig davon, ob man mehrere Visualisierungen mit dem gleichen Merkmal (Option 1) machen möchte oder
# das Merkmal immer wieder ändert (Option 2).

# 1. Option
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill='White', color="Blue") # Zur Erinnerung das ist ein Setting

# 2. Option
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating),fill='White', color='Blue')

#----- Statisitcal Transformationen
u <- ggplot (data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
u + geom_point() + geom_smooth(fill=NA)

# Eine ander Sicht auf die Datenverteilung erhalten wir mit Boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1) + geom_point()
u + geom_boxplot(size=1) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)
