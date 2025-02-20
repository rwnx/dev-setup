#!/bin/zsh
set -euo pipefail

echo "Bootstrapping development environment setup..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
fi

# Install pipx via Homebrew
echo "Installing pipx..."
brew install pipx
# Modify zshrc
pipx ensurepath

# add pipx paths just for this script
export PATH="$PATH:$HOME/.local/bin"

# Install Ansible via pipx
echo "Installing Ansible..."
pipx install ansible

echo "Running Ansible playbook..."
ansible-playbook playbook.yml
