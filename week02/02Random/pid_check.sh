#!/bin/bash

# Die ersten beiden Argumente in Variablen speichern
pid="$1"
seconds="$2"

#counter zum zählen der insg vergangenen Sekunden
counter=0

#Schleife die die Überprüfung alle x sekunden ausführt
while true; do 
    if ps -p $pid > /dev/null; then
        echo "Der Prozess, identifiziert durch die PID $pid, läuft."
    else 
        echo "Der Prozess, identifiziert durch die PID $pid, läuft nicht."
    fi
    sleep $seconds

    #Endlosschleifen abbruch nach ca 20 sekunden
    ((counter+=$seconds))
    if ((counter >= 20)); then
        echo "Die Überprüfung wurde nach $counter Sekunden beendet."
        break
    fi

done
