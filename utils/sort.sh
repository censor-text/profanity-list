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
        echo "File '$file' not found"
        exit 1
    fi
fi

# Remove duplicates and overwrite the file with a sorted list of words
for filename in $file; do
    sort -u "$filename" -o "$filename"
    echo "Sorted and removed duplicates in '$filename'"
done

echo "Done!"
