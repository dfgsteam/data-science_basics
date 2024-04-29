#!/bin/bash

#awk '{ if ($0 ~ /[IVX]+$/) { kapitelnum++; dir="./Exercise02/Kapitel" kapitelnum; system("mkdir \"" dir "\"")} }' exercise/grundgesetz.txt

i=0
for kapitel in ./Exercise02/Kapitel*; do
    i=$((i+1))
    awk '/^Artikel?/{f=1} f' ./Exercise02/Kapitel"$i" | csplit -s -z -f "./Exercise02/output_"  - '/^Artikel [0-9, a-z]/' {*}
    mkdir ./Exercise02/K"$i"
    
    for file in ./Exercise02/output_*; do
        artikel=$(cat "$file" | head -n 1)
        mv "$file" "./Exercise02/K$i/$artikel"
    done
done