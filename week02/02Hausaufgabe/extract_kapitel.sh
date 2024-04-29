#!/bin/bash

CURLINE=1                      # Zeilennummer wo das derzeitige Kapitel anfängt
CURKAPITEL="I Die Grundrechte" # Name des derzeitigen Kapitels
grep -n '^[A-Z][A-Za]*$' grundgesetz-new.txt | grep -v '^1:I$' | while IFS=':' read NEXTLINE NEXTKAPITEL; do # Schleife über die Anfangszeile mit Zeilennummer des jeweils nächsten Kapitels
	NEXTKAPITELTITLE="$(sed "$((NEXTLINE + 1))!d" grundgesetz-new.txt)" # Extrahiere Titel des nächsten Kapitels
	NEXTKAPITEL="${NEXTKAPITEL} $NEXTKAPITELTITLE"
	#echo "==============================================================="
	#echo "LINE: $LINE"
	echo "KAPITEL: $CURKAPITEL"
	tail -n "+$CURLINE" grundgesetz-new.txt | head -n "$((NEXTLINE-CURLINE))" > "Kapitel-${CURKAPITEL}.txt" # Schreibe derzeitige Kapitel
	tail -n "+$NEXTLINE" grundgesetz-new.txt > "Kapitel-${NEXTKAPITEL}.txt" # Wichtig um letztes Kapitel zu schreiben
	CURLINE=$NEXTLINE
	CURKAPITEL="$NEXTKAPITEL"
done
