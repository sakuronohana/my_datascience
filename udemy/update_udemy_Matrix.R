# Ab Lession 38 - Function

# Creating Functions in R

myplot <-function(data, rows=1:10){ #rows (mit Default-Wert 1:10) und data ist die Variable für die Auswahl der Spieler des Datensatzes
Data <- data[rows,,drop=F] # die Variable ist hier und 
matplot(t(Data), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset=0.01, legend=Players[rows],col=c(1:4,6),pch=15:18) #hier
}

myplot(Salary,3:2) # Hier wird die Variable genommen und in die Variablen der funktion übertragen

# Analyse der Basketball Daten

# Hier sehen wir den Lohn der Spieler
myplot(Salary)

# Hier wollen wir sehen wieviel ein Spieler pro Spiel verdient hat
myplot(Salary/Games) 
''' Wir sehen hier zwei Ausreiser bzw. die Spieler Kobe Bryant und Derrick Rose haben hier 
in einem speziellen Jahr pro Spiel viel verdient. Der Grund sehen wir, wenn wir uns den 
Datensatz Games ansehen
'''
Games
''' Kobe Bryant hat im 2013 sehr wenige Games gespielt und Derrick Rose im 2012/2013 ebenfalls.
Wenn nun also der Salary durch die wenige Spiele dividiert wird, ergibt es eine grosse Summe 
pro Spiel'''

# Bei der Analyse der gespielten Minuten zeigt sich das Bild erneut. 
myplot(MinutesPlayed)

# Das gleiche bei der Punktestatistik
myplot(Points)

''' Aus analtytischer Sicht besteht hier die Möglichkeit nur die Daten zu vergleichen, welche
ebenfalls von den Ausreissern betroffen sind, somit hebt sich das Problem wieder auf. '''
myplot(FieldGoals)
myplot(FieldGoals/FieldGoalAttempts)
'''In diesem Vergleich sehen wir, dass Dwight Howard im Vergleich zu seinen Goals viele Attempts hat.
Er hat also pro Goal viele Versuche bzw. seine Treffersicherheit ist nicht optimal'''

myplot(FieldGoalAttempts/Games)
'''Schauen wir uns jedoch den Vergleich zwischen den Attempts und den Spielen an, dann sehen 
wir Dwight an unterster Stelle'''
