#!/bin/bash

TARGET_DIR="/Users/$(whoami)/Pets/ansible"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git not found. Installing Git..."
    brew install git
else
    echo "Git is already installed."
fi

# Create the target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating directory $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
fi

# Clone the repository into the target directory
if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Cloning repository into $TARGET_DIR..."
    git clone https://github.com/dsomleff/ansible.git "$TARGET_DIR"
else
    echo "Repository already exists at $TARGET_DIR. Pulling latest changes..."
    cd "$TARGET_DIR" && git pull
fi

# Change to the cloned repository directory
cd "$TARGET_DIR" || exit

# Install Ansible
echo "Installing Ansible..."
brew install ansible

# Run your Ansible playbook (now called `setup_new_machine.yml`)
echo "Running Ansible playbook..."
ansible-playbook playbook.yml

