# Zeitreihenanalyse mit R
# Tutorial https://novustat.com/statistik-blog/zeitreihenanalyse-fuer-dummies-in-r.html

require(datasets) # library(help = 'datasets')

show(USAccDeaths) # Zeigt Datensatz

ts_usacad <- USAccDeaths # R-Variable erstellen

# Wie bei jeder Anaylse erstellt man zuerst eine Grafik
plot.ts(ts_usacad)
plot.ts(ts_usacad,type='p')
plot.ts(ts_usacad,type='o')

# Mit R können wir nun die drei Komponenten einer Zeitreihe
# aufspliten

ts_usacad_comp <- decompose(ts_usacad)
plot(ts_usacad_comp)
''' 
Kurze Erklärung zum Plot:
1. Zeile = Orginal Plot
2. Zeile = Trendlinie
3. Zeile = Saisonale Sicht
4. Zeile = Zufällige Komponenten
'''
#Vorhersagen modellieren mit Holt Winters Verfahren
ts_usacad_trend <- HoltWinters(ts_usacad, alpha = 0.1, beta = FALSE, gamma = FALSE)
plot(ts_usacad_trend)
plot(ts_usacad_trend, type='p')
plot(ts_usacad_trend, type='o')

#Für die Berechnung von Vorhersagen im R wird das Packet forecast benötigt
install.packages('forecast')
library(forecast)

# Vorhersage berechnen, h ist die Anzahl Monate die vorhergesagt werden 
forecast(ts_usacad_trend, h=8)

chbirth <- read.csv('data/chbirthrate.csv')
chbirth
