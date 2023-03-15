# Update the system packages
sudo apt-get update

# Install the dependencies required to build and run a GitHub server
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install Pyenv, a tool for managing multiple Python versions
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

exec $SHELL

pyenv install 3.9.1
pyenv global 3.9.1

curl -sSL https://install.python-poetry.org | python3 -

echo 'export PATH="/home/ludger/.local/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# Configure Poetry to create virtual environments inside the project's root directory
poetry config virtualenvs.in-project true

sudo apt-get install git

echo 'Please Add your github account or use a github token to clone your repository'
