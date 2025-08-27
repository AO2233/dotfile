#!/bin/bash

# ==============================================================================
#  Dotfile Apply Script
# ==============================================================================
#
#  This script applies (copies) specified dotfiles and directories from this
#  Git repository to your home directory (~/), overwriting existing files.
#
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status.

# Set the source directory to the location of this script.
# This ensures that the script can be run from anywhere.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

echo "🔵 Starting dotfile application..."
echo "Source repository: $REPO_DIR"
echo "Destination home: $HOME_DIR"
echo ""

# --- Configuration ---
# Add the names of directories located in ~/.config that you want to apply.
CONFIG_DIRS=(
    "alacritty"
    "mpv"
    "nvim"
    "zellij"
)

# Add the names of files located directly in your home directory (~) to apply.
HOME_FILES=(
    ".gitconfig"
    ".tmux.conf"
    ".vimrc"
    ".zshrc"
)

# --- Application Process for .config Directories ---
echo "🔄 Applying ~/.config directories..."
for dir in "${CONFIG_DIRS[@]}"; do
    SOURCE_PATH="$REPO_DIR/.config/$dir"
    DEST_PATH="$HOME_DIR/.config/$dir"

    if [ -d "$SOURCE_PATH" ]; then
        echo "  -> Applying '$dir'..."
        mkdir -p "$(dirname "$DEST_PATH")" # Ensure parent directory exists
        # Use rsync to copy and overwrite, --delete removes files in dest not in source
        rsync -av --delete "$SOURCE_PATH/" "$DEST_PATH/"
    else
        echo "  ⚠️ SKIPPING: Source directory '$SOURCE_PATH' not found in repository."
    fi
done
echo "✅ Done with .config directories."
echo ""

# --- Application Process for Home Directory Files ---
echo "🔄 Applying home directory files..."
for file in "${HOME_FILES[@]}"; do
    SOURCE_PATH="$REPO_DIR/$file"
    DEST_PATH="$HOME_DIR/$file"

    if [ -f "$SOURCE_PATH" ]; then
        echo "  -> Applying '$file'..."
        cp -p "$SOURCE_PATH" "$DEST_PATH"
    else
        echo "  ⚠️ SKIPPING: Source file '$SOURCE_PATH' not found in repository."
    fi
done
echo "✅ Done with home directory files."
echo ""

# --- Finalization ---
echo "🎉 Dotfile application complete!"
echo "Your dotfiles have been updated."