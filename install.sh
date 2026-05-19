#!/bin/bash

# Setup script for environment tools

# 1) Create tools directory
mkdir -p "$HOME/codespace_tools"

# 2) Clone repositories with check
clone_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url")
    local target_dir="$HOME/codespace_tools/$repo_name"
    if [ ! -d "$target_dir" ]; then
        echo "Cloning $repo_url into $target_dir..."
        git clone "$repo_url" "$target_dir"
    else
        echo "Directory $target_dir already exists. Skipping clone."
    fi
}

clone_repo "https://github.com/anomalyco/opencode"
clone_repo "https://github.com/github/spec-kit"
clone_repo "https://github.com/DenisSergeevitch/agents-best-practices"

# 3) Install VS Code extension
if command -v code &> /dev/null; then
    echo "Installing VS Code extension: ritwickdey.LiveServer..."
    code --install-extension ritwickdey.LiveServer
else
    echo "VS Code CLI (code) not found. Skipping extension installation."
fi
