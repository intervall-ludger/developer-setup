#!/bin/bash
# This bash script installs necessary dependencies, sets up pyenv and Poetry, and configures Poetry to create virtual environments inside the project's root directory. Run this script to quickly set up a new Python environment for your project.


# Update package lists and install necessary dependencies
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install Git
sudo apt install git

# Install pyenv
curl https://pyenv.run | bash

# Set up pyenv in the shell
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Restart the shell to make sure the changes take effect
exec $SHELL

# Check that pyenv is working
pyenv --version

# Install Python 3.9.1 with pyenv
pyenv install 3.9.1
pyenv global 3.9.1

# Install Poetry using curl
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# Add poetry to the shell path
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.bashrc


# See the Poetry documentation for instructions on enabling tab completion in the shell
poetry help completions

# Configure Poetry to create virtual environments inside the project's root directory
poetry config virtualenvs.in-project true
