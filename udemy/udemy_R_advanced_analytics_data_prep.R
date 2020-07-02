fin <- read.csv('P3-Future-500-The-Dataset.csv')
str(fin) 
summary(fin)

'''
Mittels der Structure Befehls können wir ja sehen, ob R aus dem importierten Datensatz
bereits Factoren erstellt hat. Hier aber nochmal einen kurzen Recap was Factors sind.

Ein Factor ist grundsätzlich ein Anzahl kategorischer Werte eines Features, welche R erkennt
und für sich nummeriert.

Mittels str sehen wir auch, welche Datentypen R auch noch erkannt hat, bzw. umgewandelt hat.
Während dieser Phase der Datenaufbereitung müssen wir uns immer überlegen, ob der zugewiesene Datentyp 
überhaupt Sinn macht. Bspw. sehen wir, dass R die ID und Inception als Integer definiert. 
Dieser Datentypen für diese Merkmale machen aber nicht unbedingt Sinn. 

Auf der anderen Seite hat R bspw. die Werte des Merkmals Revenue (Einnahmen) und Expenses (Ausgaben)
als Factor bzw. kategorische Werte erkannt was wiederum keinen Sinn macht, da wir ja mit diesen
Werten arithmetische Operationen durchführen wollen.

Wir haben hier also schon mal Punkte die wir bereinigen müssen.
'''
# Konvertierung von Datentypen

# Die Konvertierung ist in R ganz einfach
fin$ID <- factor(fin$ID) # Wandelt einen Int in eine Factor um
fin$Inception <- factor(fin$Inception)
str(fin) # Checken wir es kurz ... und es ist nun ein Factor

# Nach dem wir nun den Datentype geändert haben, wollen wir die Wert noch von Quotes usw. säubern
# Hierzu gibt es im R die Funktionen sub() und gsub(). 

# gsub() wird dabei am meisten eingesetzt, da wir mehrere Dinge gleichzeitig bereinigen können
fin$Expenses <- gsub(" Dollars", "", fin$Expenses) # Zuerst löschen wir das Wort Dollars und Leerzeichen
fin$Expenses <- gsub(",","",fin$Expenses) # und nun noch die Kommas
head(fin)
str(fin) # Wir sehen in der Struktur-Information, dass Expenses nun als Charater erkannt wird und nicht mehr als Factor

fin$Revenue <- gsub('$','', fin$Revenue) # nur wollen wir noch das Dollarzeichen von den Einnahmen entfernen
head(fin) # Wie wir sehen ....das Dollarzeichen ist immer noch da :-(. Das Dollarzeichen hat einen speziellen Funktione innerhalb R. Das Problem kann wie folgt gelöst werden
fin$Revenue <- gsub('\\$','',fin$Revenue) # Voila ... das Dollarzeichen ist weg. Backslash auf Mac Alt+Umschalt+7
fin$Revenue <- gsub(',','',fin$Revenue) # nun löschen wir noch die Kommas 
fin$Growth <- gsub('%','',fin$Growth) # bei Growth nehmen entfernen wir nun noch Prozentzeichen
# Nun wandeln wir noch alle 3 Merkmale in nummerische Werte um
fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Growth <- as.numeric(fin$Growth)
str(fin) # Wie wir nun sehen können sind die Merkmale konvertiert.

# Umgang mit fehlenden Werten
'''
Es gibt verschiedene Möglichkeiten wie man mit fehlenden Werten umgehen kann:
1. Die fehlenden Werte mit Werten ersetzen die offensichtlich sind. Bspw. aus den anderen Werten lässt sich mit Bestimmtheit der fehlende Wert ableiten
2. So lassen wie es ist. Wenn der Wert für die weitere Analyse nicht von belangen ist, dann müssen wir auch nichts machen.
3. Die Zeile mit den fehlenden Wert löschen. Diese Vorgehen ist nur dann zu empfehlen, wenn genügen Daten zur Verfügung stehen.
4. Ersetze den Wert mit dem arithmetischen Mittelwert oder einem Median. Hinweis: Der Median sollte wenn immer präferenziert werden da er sich nicht von Ausreissern beeinflussen lässt
5. Ersetze den Wert durch Korrelationen oder ähnliche Werte. 
6. Ersetze den fehlenden Wert mit Dummy-Werten die das Fehlen von Werten anzeigt.Bswp.
'''


