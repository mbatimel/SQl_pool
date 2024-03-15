#!/bin/bash

for i in {00..6}; do
    directory="ex0$i"
    mkdir "$directory"
    if [ -d "$directory" ]; then
        echo "Entering directory $directory"
        cd "$directory" || exit 1
        touch "day06_$directory.sql"
        echo "Created file in $directory"
        cd ..
    else
        echo "Directory $directory does not exist"
    fi
done
