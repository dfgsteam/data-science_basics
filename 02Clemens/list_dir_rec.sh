#der inhalt des current dir wird noch nicht angezeigt...
#!/bin/bash

function list_dir() {
    #pfad des verzeichnisses aus dem ersten übergebenen argument
    local dir="$1"
    #variable die den aktuellen indent in diesem rekursionsschritt hält
    local indent="$2"

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            # gib nur die dateien aus dem auktuellen verzeichnis aus
            printf "%s%s\n" "$indent" "File: $file"
        fi
    done

    # foreach schleife die alle einträge aus dem aktuellen verzeichnisse und unterverzeichnissen durch geht
    for directory in "$dir"/*; do
        # falls der eintrag ein directory ist...
        if [ -d "$directory" ]; then
            #erstelle variable mit dem aktuellen subverzeichniss
            local subdir="$directory"
            #erstelle variable mit der vorhergegangen einrückung und füge eine neue hinzu
            local new_indent="$indent  "
            # gib eine neue zeile, die einrückung und den namen des sub dirs aus
            printf "%s%s\n" "$indent" "Directory: $subdir"          
            #rekursiver aufruf mit dem subdir als startverzeichnis im ersten argument, im zweiten der neue einrückungsgrad
            list_dir "$subdir" "$new_indent"
        fi
    done
}

#start_dir hält jetzt den wert aus dem ersten argument, hier: ein pfad zu einem verzeichnis
start_dir=$1
#aufruf der funktion mit start pfad zu dem zu durchsuchenden verzeichnis im ersten argument, im zweiten die start einrückung (keine beim ersten durchlauf)
list_dir "$start_dir" ""