#!/bin/bash

# '$1' is first argument, input file

outFile="$(basename "$1" .csv)-clean.csv" # creates output filename

sed 's/\("[^"]*[^[:space:]]\)\s\+"/\1"/g' "$1" | awk 'NF' > "$outFile"
# 'sed' removes whitespace between last non-whitespace character and closing quotation mark
# 'awk' prints non-empty lines by checking for number of fields

echo "Cleaned Output: $outFile"
