fin <- read.csv('P3-Future-500-The-Dataset.csv')
str(fin) 
summary(fin)

'''
Mittels der Structure Befehls können wir ja sehen, ob R aus dem importierten Datensatz
bereits Factoren erstellt hat. Hier aber nochmal einen kurzen Recap was Factors sind.

Ein Factor ist grundsätzlich ein Anzahl kategorischer Werte eines Features, welche R erkennt
und für sich nummeriert.

Mittels str (Struktur) sehen wir auch, welche Datentypen R auch noch erkannt, bzw. umgewandelt hat.
Während dieser Phase der Datenaufbereitung müssen wir uns immer überlegen, ob die zugewiesenen Datentypen 
überhaupt Sinn machen. Bspw. sehen wir, dass R die ID und Inception als Integer definiert. 
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

# Was sind NAs
'''
Wenn wir uns mit fehlenden Datenwerten beschäftigen, dann kommen wir nicht um das Thema NA umher
NA steht für Not Available und ist ein Indikator für einen fehlenden Wert. NA ist eine logische Konstante
welche wir ja bereit von TRUE (1) und FALSE (0) kennen. 
'''
?NA # Mittels der Hilfe können wir mehr über NA erfahren.
is.na(fin) # mittels dieser Funktion können einen Datensatz nach NAs absuchen. 

# Methoden zur Auffindung fehlender Wert

# Um fehlende Wert aufzuspüren können wir den Datensatz anzeigen lassen. 
head(fin, 25)
# Das Problem welches hier besteht ist, dass wenn ein Datensatz mehrere Tausend bis Millionen Records hat
# es mal schnell sehr unübersichtlich wird. Hierfür haben wir folgenden Möglichkeit
fin[!complete.cases(fin),] # Nun werden uns alle Zeilen angezeigt, welche NAs haben

# Das ist ja schön und gut aber, wenn wir uns nochmal eine Übersicht der ersten 25 Zeilen des
# Datensatzes machen, dann werden wir feststellen, dass wir auch leere Datenfelder bzw. Datenfelder 
# ohne NAs haben.
head(fin, 25)

# Um diese Problem zu lösen müssen wir alle leeren Felder mit NA befüllen und das machen wir am Besten
# wenn wir den Datensatz importieren.
fin <- read.csv('P3-Future-500-The-Dataset.csv', na.strings = ('')) # Mit dem Zusatz na.strings erledigen wir das Problem im nu.
head(fin, 25)
# Der aufmerksame Betrachter wird jetzt natürlich erkennen, dass wir NAs mit <> und ohne haben
# Die Erklärung hierzu ist ganz einfach. R zeigt uns damit, dass es sich um ein kategorisches Datenfeld handelt und hilft uns dabei
# die NAs besser herauszusehen.
fin[!complete.cases(fin),] # So und nun werden uns alle Zeilen mit NAs angezeigt.

# Selektion von nicht fehlenden Daten.
# Auch hier gibt es verschiedene Wege Daten zu filtern bzw. zu finden.

fin$Revenue == 9684527 # Gibt die Boolean Werte TRUE/FALSE zurück, zugegeben etwas unübersichtlich
fin[fin$Revenue == 9684527,] # Nun haben wir nur die Zeile mit dem Wert jedoch mit einen NA Output der nicht so schön ist. 

# Es gibt jedoch eine Abfragemöglichkeit mit der Funktio which die exakt den Wert ausgibt den wir haben wollen.

fin[which(fin$Revenue == 9684527),]
fin[which(fin$Employees == 45),]
fin[which(fin$Inception != '2013'),] # mit != schliesse ich etwas aus

# Selektion von fehlenden Daten
# Nun wollen wir noch die Selektion von Daten mit NA genau im gleichen Stil ausführen. Dabei können wir auf die Funktion is.na zurückgreifen.
fin[is.na(fin$Revenue),]
fin[is.na(fin$Expenses),]

# Löschen von Records mit fehlenden Daten
# Beschäftigen wir uns nun mit dem löschen von fehlenden Zeilen. Wichtig ist das wir immer eine Sicherung des Zwischenstandes machen
fin_backup <- fin
fin[is.na(fin$Expenses),] # Bevor wir anfangen lassen wir uns nochmal alle Records mit fehlenden Daten zeigen.

# Damit wir nun nicht jede Zeile eins Merkmals einzeln entfernen müssen gibt es einen guten Trick .. wir sichern alle Records die kein NA habe in der gleichen Variable
fin <- fin[!is.na(fin$Industry),]
fin[is.na(fin$Industry),] # Wir sehen nun, R gibt keine Zeile mehr mit NA im Merkmal Industry zurück.

# Resetting DF Index
# Wenn wir Zeilen löschen, wie wir es oben getan haben, dann wird auch der entsprechenden Index gelöscht. 
head(fin, 25) # Hier sehen wir, dass bspw. der Index 14 und 15 gelöscht wurden.

# Oft ist es zwar unschön stellt aber in der Data Analytics kein wirkliches Problem dar. Möchte man den Index jedoch wieder korrigieren, dann
# sind die folgenden zwei Methode die Einfachste:
rownames(fin) <- 1:nrow(fin)
rownames(fin) <- NULL
fin # Wir sehen die Lücke zwischen 13 und 16 ist wieder geschlossen

# Ersetzen von fehlenden Daten mit der Factual Analysis Method
# Manchmal können wir fehlende Daten ganz einfach auf der Grundlage bestehender ähnlicher Records ersetzen. In unserem Datensatz ist dies bspw. 
# bei Merkmal State der Falle 
fin[!complete.cases(fin),] # Wir sehen hier bspw. bei der Stadt New York der fehlende Staad den wir einfach mit NY ergänzen können.
fin[is.na(fin$State),] # Mit dieser Selektion können wir sehen, dass uns 4 State Werte fehlen.
# Da wir ja nicht viele Werte im diesem Merkmal haben, welche uns fehlen, können wir diese einzeln ergänzen
fin[is.na(fin$State) & fin$City == 'New York','State'] <- 'NY'
fin[is.na(fin$State) & fin$City == 'New York',] # erledigt :-)
fin[is.na(fin$State) & fin$City == 'San Francisco','State'] <- 'CA'
fin[is.na(fin$State) & fin$City == 'San Francisco',] # auch erledigt

# Ersetzen von Werten mittels Median
'''
Im Zusammenhang mit fehlenden nummerische Werte können oft auch statistische oder arithmetische
Vorgehen/Berechnungen helfen einen fehlenden Wert zu ersetzen.In diesem Beispiel werden wir den Median
verwenden. Wichtig bei der ganzen Sache ist, dass nicht einfach den Median oder auch Mean
des ganzen Merkmals nehmen sondern auch noch andere Faktoren wie bspw. Industriezweig mit einbeziehen.
Der Median in Esswarenhandel kann von von dem im Bereich Gesundheit differenzieren.
'''
fin[!complete.cases(fin),]
# In der dritten Reihe auf dem Merkmal Employees finden wir einen fehlenden Wert NA.
median(fin[,'Employees'], na.rm=TRUE) # Da wir noch einen NA im Merkmal Employees haben müssen wir diesen Ausklammern
# Wir wollen nun nicht das Merkmal Indurstry miteinbeziehen.
median(fin[fin$Industry=='Retail','Employees'], na.rm=TRUE)

