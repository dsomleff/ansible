# Ansible Setup for New macOS Machine

This repository contains scripts to automate the setup of a new macOS machine using Ansible.

## Prerequisites

Before running the setup script, follow these instructions to ensure it runs smoothly on your new machine.

## Instructions for Running the Script

1. **Copy `setup_new_machine.sh` to your new machine.**

2. **Make the script executable:**

   ```bash
   chmod +x setup_new_machine.sh
   ```

3. **Run the script from any location:**

   ```bash
   ./setup_new_machine.sh
   ```

## Working with Tags

### Running with Tags

To execute tasks with specific tags, use the `--tags` option when running your playbook. For example:

```bash
ansible-playbook playbook.yml --tags zsh
```

This command would run only the tasks tagged with `zsh`, skipping all other tasks.

### Excluding Tags

You can also exclude tasks with specific tags using the `--skip-tags` option:

```bash
ansible-playbook playbook.yml --skip-tags zsh
```

This command would run all tasks except those tagged with `zsh`.
