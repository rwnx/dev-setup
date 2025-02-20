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

echo "Installing ansible..."
brew install ansible

echo "Running Ansible playbook..."
ansible-playbook playbook.yml
