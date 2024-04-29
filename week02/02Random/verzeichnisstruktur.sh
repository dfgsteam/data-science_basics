#!/bin/bash

#Funktion zum Verzeichnis-ausgeben
dir_content() {
   
    #lokale Variablen zur klaren Trennung innerhal und außerhalb der Funktion
    local dir="$1"      #Directory
    local tab="$2"      #Einrückungs-platzhalter

    #aktuelles Verzeichnis wird ausgegeben
    echo "${tab}Directory: $dir"
    local tab="$2    "  #Einrückung muss für nächste Stufe erweitert werden

    #alle Elemente im Verzeichnis werden durchlaufen
    for item in "$dir"/*; do
        if [ -d "$item" ]; then                 #-d prüft ob das Element ein Verzeichnis ist
            dir_content "$item" "$tab    "      #rekursiver Aufruf um die Elemente im gefundenen Verzeichnis aufzulisten
        else
            echo "${tab}File: ${item}"          #Schöner:? aktuelle Datei wird ausgegeben; "##*/" bestimmt, dass Dateinamen ohne Directory ausgegeben wird (also ohne alles bis zum letzten /)
        fi
    done

}

#Funktion zum Verzeichnis-ausgeben wird mit Verzeichnis als Parameter aufgerufen
dir_content "$1" ""