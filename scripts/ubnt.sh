#!/bin/bash

ARCHIVE='../archive'
REPO='.'

inotifywait -m $ARCHIVE -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"

        if [[ "$file" =~ ^config\.boot-(.*)\.[0-9]*_[0-9]*$ ]]; then
            echo "Valid ubnt file, moving it to repo and pushing"
            mv "$ARCHIVE/$file" "$REPO/${BASH_REMATCH[1]}"
            git add .
            git commit -m "${BASH_REMATCH[1]} by netbackup"
            git push
        else
            echo "Invalid file"
        fi
    done
