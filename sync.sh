#!/bin/bash

# Script for syncing whatever needs to go to Github dev/ repo.

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to the script's directory
cd "$SCRIPT_DIR" || { echo "Error: Cannot access script directory"; exit 1; }

# Dotfiles
DOTFILES_DIR="dotfiles"
cp ~/.zshrc "$SCRIPT_DIR/$DOTFILES_DIR/zshrc"

# Stage all changes
git add .

# Commit changes with a timestamp
git commit -m "update: $(date)" || { echo "Nothing to commit"; exit 0; }

# Push to GitHub
git push origin main || { echo "Error: Failed to push to GitHub"; exit 1; }

echo "Dev files synced successfully!"
