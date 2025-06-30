#!/bin/bash
#
# finder.sh
# Author: plushpluto
# Description:
#   This script searches for a text string within all files in a directory 
#   and its subdirectories. It counts the total number of files and the 
#   number of lines containing the search string.
#
# Usage:
#   ./finder.sh <filesdir> <searchstr>
#
# Parameters:
#   filesdir  - path to a directory on the filesystem to search
#   searchstr - text string to search for within files
#
# Requirements:
#   - find command
#   - grep command
#   - Directory specified in filesdir must exist
#
# Exit Codes:
#   0 - Success
#   1 - Invalid arguments or directory not found
#

# Declaring the variables
filesdir=$1
searchstr=$2

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "\nError: This script requires exactly two arguments."
    echo "This script searches for a text string within all files in a directory and its subdirectories."
    echo "It counts the total number of files and the number of lines containing the search string."
    echo "  First argument: filesdir - path to a directory on the filesystem"
    echo "  Second argument: searchstr - text string to search for within files"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir does not represent a directory on the filesystem"
    exit 1
fi

# Count the number of files in the directory and all subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines containing searchstr
matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $file_count and the number of matching lines are $matching_lines"
