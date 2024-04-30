#!/usr/bin/env bash

# Check if a filename is passed as an argument
if [[ "$1" == '--help' ]]; then
    echo "Usage: $0 [file]"
    exit 0
elif [[ -z "$1" ]]; then
    file=( "list/*.txt" )
else
    file="$1"

    # Check if the specified file exists
    if [[ ! -f "$file" ]]; then
        echo -e "File '\e[1m$file\e[0m' not found"
        exit 1
    fi
fi

# Remove duplicates and overwrite the file with a sorted list of words
for filename in $file; do
    # Find and print duplicated lines
    duplicates=$(sort "$filename" | uniq -d)
    if [[ -n "$duplicates" ]]; then
        echo -e "\nDuplicated lines in '\e[1m$filename\e[0m':"
        for word in $duplicates; do
            echo "- $word"
        done
        echo ""
    fi

    sort -u "$filename" -o "$filename"
    echo -e "Sorted '\e[1m$filename\e[0m'"
done

echo -e "\e[1;32mDone!\e[0m"
