#!/bin/bash

echo "Enter directory path to search for duplicates: "
read directory_path

# Function to calculate SHA256 hash of a file
calculate_hash() {
    sha256sum "$1" | awk '{print $1}'
}

# Temporary file to hold hashes
temp_file="hashes_temp.txt"
> "$temp_file"

# Searching for files and calculating hashes
find "$directory_path" -type f | while read -r file_path; do
    echo "Scanning $file_path"
    file_hash=$(calculate_hash "$file_path")
    echo "$file_hash $file_path" >> "$temp_file"
done

# Generating CSV with duplicates
current_time=$(date +"%Y-%m-%d_%H-%M-%S")
csv_file="duplicates_$current_time.csv"
echo "Hash, File Paths" > "$csv_file"

sort "$temp_file" | uniq -w 64 -D | while read -r line; do
    echo "$line" | awk '{print $1","$2}' >> "$csv_file"
done

# Display the CSV content
column -t -s, "$csv_file"

# Clean up
rm "$temp_file"
