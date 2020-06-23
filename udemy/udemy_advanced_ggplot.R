''' 
In diesem Tutorial werden wir uns überwiegend mit der Visualisierung befassen. Wenn es um die Visualisierung 
im R geht, dann kommt man an GGPlot nicht vorbei.
Eine Plot besteht im Idealfall aus folgenden Komponenten:
- Data (Dataframe)
- Aesthetics, Ein Set von Verknüpfungen zwischen Variablen in den Daten und visuellen Eigenschaften (aesthetics)
- Geometries ist ein geometrisches Layer-Objekt das beschreibt, wie jeder Datenpunkt gerendert (aufbereitet, wiedergegeben) wird
- Statistik bzw. statistische Verfahren
- Facets, sind verschiedenen Plots in einem Graph
- Koordinaten, sind die Daten auf einer x/y Achse
- Theme, sind Titel, x/y Achstenbezeichnung etc
'''
# ---- Data-Import
movies <- read.csv('P2-Movie-Ratings.csv')
head(movies)
colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating', 'BudgetMillions', 'Years')

# ---- Was sind Factors

