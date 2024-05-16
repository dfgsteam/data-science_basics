#!/bin/bash

# Eingabedatei
input_file="titanic.csv"

# Ausgabedatei
output_file="newtitanic.csv"

# Umwandlung von ; zu ,
sed 's/;/,/g' "$input_file" > temp.csv

# Korrektur von Zeilenumbrüchen innerhalb der Felder
awk 'BEGIN { FS = OFS = "," } { if (substr($0, length($0), 1) != "\"") { print } else { printf("%s", $0) } }' temp.csv > "$output_file"

# Aufräumen
rm temp.csv

echo "Die Konvertierung wurde abgeschlossen. Die Ausgabedatei lautet: $output_file" 
