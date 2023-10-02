#!/bin/bash

# Check if the user provided an item to give execute permission to
if [ $# -eq 0 ]; then
    echo "Usage: $0 <item_to_give_execute_permission>"
    exit 1
fi

# Give execute permission to the specified item
chmod +x "$1"

# Run Git commands
git add .
git status  # Show the status to confirm changes
read -p "Enter your commit message: " commit_message

# Commit with the provided message
git commit -m "$commit_message"

# Push to the remote repository
git push

echo "Script completed."
