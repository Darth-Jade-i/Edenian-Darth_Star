#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Get the file extension
extension="${filename##*.}"

case "$extension" in
    c)
	# C program content
	    program='''#include <stdio.h>

/**
 * main - Entry point
 *
 * Return: Always 0 (Success)
 */

int main(void)
{
    printf("Hello, World!\\n");
    return (0);
}
'''
	    # Check the C program code with Betty linter
	    betty_output=$(betty-style "$filename")
	    if [ $? -eq 0 ]; then
		echo "Betty style check passed for $filename."
	    else
		echo "Betty style check failed for $filename:"
		echo "$betty_output"
	    fi
	    ;;
    py)
	# Python program content
	    program='''print("Hello, World!")
'''
	    ;;
    html)
	# HTML program content
	    program='''<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>
'''
	    ;;
    css)
	# CSS program content
	    program='''body {
    font-size: 16px;
    color: #333;
}
'''
	    ;;
    js)
	# JavaScript program content
	    program='''console.log("Hello, World!");
'''
	    ;;
    *)
	echo "Unsupported file extension: .$extension"
	exit 1
	;;
esac

# Writing the program content to the file
echo "$program" > "$filename"

echo "$filename has been created with the respective program content."

# Prompt to open the file in Vim or Emacs
read -p "Do you want to open the file in Vim (v) or Emacs (e)? (v/e/n): " choice
case "$choice" in
    [Vv]*)
	vim "$filename"
	;;
    [Ee]*)
	emacs "$filename"
	;;
    *)
	echo "File has not been opened."
	;;
esac
