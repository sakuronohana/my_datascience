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
fin$Expenses <- gsub(" Dollars", "")

