#!/bin/bash

if [ $# -eq 2 ] 
then
    while true 
    do
    	if ps -p $1 > /dev/null 	# ps: informationen über laufende prozesse in linux umgebungen
        							# -p: ergebnisse nach PID filtern
                                    # $1: wert des ersten übergebenen arguments
        							# >: umleitungsoperator
        							# /dev/null: an das nullgerät (wir brauchen den rückgabewert nicht)				
        then
            echo "$1 is running"
        else
            echo "$1 is not running"
        fi
        sleep $2				# warte $2 (den wert des zweiten übergebenen arguments) in sekunden
    done
else
    echo "2 Argumente erwartet"
fi