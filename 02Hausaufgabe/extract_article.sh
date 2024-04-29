#!/bin/bash
for KFILE in Kapitel-*.txt ; do # Schleife über alle Kapiteltext Dateien in dem Ordner
	KDIR="$(echo "$KFILE" | cut -d '.' -f 1)" # Der Ordnername für das Kapitel (Dateiname ohne .txt)
	echo "==============================================================="
	echo "$KDIR"
	mkdir -p "$KDIR" # Erstelle den Kapitelordner falls noch nicht vorhanden.

	pushd "$KDIR" >/dev/null # Gehe in den Kapitelordner
	KFILE="../$KFILE" # Da wir jetzt in dem Ordner sind muss der Pfad aktualisiert werden.
	
	# Die folgenden Zeilen sind analog zu extract_kapitel.sh
	CURLINE=0
	CURARTIKEL=""
	grep -n '^Artikel [0-9]*\( [a-z]\)\?$' "$KFILE" | tr ' ' '_' | while IFS=':' read NEXTLINE NEXTARTIKEL ; do
		if [ -n "$CURARTIKEL" ]; then
			echo "  $CURARTIKEL"
			tail -n "+$CURLINE" "$KFILE" | head -n "$((NEXTLINE-CURLINE))" > "${CURARTIKEL}.txt" # Schreibe derzeitige Artikel
		fi
		tail -n "+$NEXTLINE" "$KFILE" > "${NEXTARTIKEL}.txt" # Wichtig um letzten Artikel zu schreiben
		CURLINE=$NEXTLINE
		CURARTIKEL="$NEXTARTIKEL"
	done

	popd >/dev/null # Gehe aus dem Kapitelordner raus
done
