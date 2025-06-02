#!/bin/bash

# Check if a file and an output directory are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <output_directory>"
    exit 1
fi

filename="$1"
output_dir="$2"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi

# Check if the output directory exists; if not, create it
if [ ! -d "$output_dir" ]; then
    echo "Output directory not found. Creating it..."
    mkdir -p "$output_dir"
fi

# Define output file paths
part1="$output_dir/part1.ll"
part2="$output_dir/part2.ll"

# Clear the output files if they already exist
> "$part1"
> "$part2"

# Split the file into two parts
awk '
    /====/ {found=1; next} 
    !found {print > "'"$part1"'"} 
    found {print > "'"$part2"'"} 
' "$filename"

echo "File split into '$part1' and '$part2'"
