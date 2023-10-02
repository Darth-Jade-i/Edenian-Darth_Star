#!/bin/bash

# Prompt for the name of the .c file to compile
read -p "Enter the name of the .c file to compile (e.g., my_program.c): " c_file

# Check if the specified .c file exists
if [ ! -f "$c_file" ]; then
    echo "Error: The specified .c file does not exist."
    exit 1
fi

# Prompt for the name of the compiled output file
read -p "Enter the name of the compiled output file (e.g., my_program): " output_file

# Compile the .c file and create the executable
gcc -o "$output_file" "$c_file"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running Git commands..."

    # Run Git commands
    git add .
    git status  # Show the status to confirm changes
    read -p "Enter your commit message: " commit_message

    # Commit with the provided message
    git commit -m "$commit_message"

    # Push to the remote repository
    git push

    echo "Git commands completed."
else
    echo "Compilation failed. Please check your code and try again."
fi
