#!/bin/bash
set -euo pipefail

echo "Bootstrapping development environment setup..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install pipx via Homebrew
echo "Installing pipx..."
brew install pipx
pipx ensurepath

# Install Ansible via pipx
echo "Installing Ansible..."
pipx install ansible

echo "Bootstrap complete! You can now run: ansible-playbook playbook.yml"