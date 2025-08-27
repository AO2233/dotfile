#!/bin/bash

# ==============================================================================
#  Dotfile Backup Script
# ==============================================================================
#
#  This script backs up specified dotfiles and directories from your home
#  directory (~/) to this Git repository, helping you keep your configurations
#  version-controlled.
#
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status.

# Set the destination directory to the location of this script.
# This ensures that the script can be run from anywhere.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔵 Starting dotfile backup..."
echo "Repository location: $REPO_DIR"
echo ""

# --- Configuration ---
# Add the names of directories located in ~/.config that you want to back up.
CONFIG_DIRS=(
    "alacritty"
    "mpv"
    "nvim"
    "zellij"
)

# Add the names of files located directly in your home directory (~) to back up.
HOME_FILES=(
    ".gitconfig"
    ".tmux.conf"
    ".vimrc"
    ".zshrc"
)

# --- Backup Process for .config Directories ---
echo "🔄 Processing ~/.config directories..."
DEST_CONFIG_DIR="$REPO_DIR/.config"
mkdir -p "$DEST_CONFIG_DIR" # Ensure the .config directory exists in the repo.

for dir in "${CONFIG_DIRS[@]}"; do
    SOURCE_PATH="$HOME/.config/$dir"
    if [ -d "$SOURCE_PATH" ]; then
        echo "  -> Backing up '$dir'..."
        # Use -R to handle symlinks correctly and -p to preserve metadata.
        rsync -av --exclude='.git' "$SOURCE_PATH/" "$DEST_CONFIG_DIR/$dir/"
    else
        echo "  ⚠️ SKIPPING: '$SOURCE_PATH' not found."
    fi
done
echo "✅ Done with .config directories."
echo ""

# --- Backup Process for Home Directory Files ---
echo "🔄 Processing home directory files..."
for file in "${HOME_FILES[@]}"; do
    SOURCE_PATH="$HOME/$file"
    if [ -f "$SOURCE_PATH" ]; then
        echo "  -> Backing up '$file'..."
        cp -p "$SOURCE_PATH" "$REPO_DIR/"
    else
        echo "  ⚠️ SKIPPING: '$SOURCE_PATH' not found."
    fi
done
echo "✅ Done with home directory files."
echo ""

# --- Finalization ---
echo "🎉 Backup complete!"
echo "Run 'git status' to see what's changed."

