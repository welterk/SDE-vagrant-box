#! /usr/bin/env bash

#requirements
sudo apt-get install -y make 
sudo apt-get install -y build-essential 
sudo apt-get install -y libssl-dev 
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libreadline-dev 
sudo apt-get install -y libsqlite3-dev 
sudo apt-get install -y wget 
sudo apt-get install -y curl 
sudo apt-get install -y llvm 
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y	libncursesw5-dev
sudo apt-get install -y xz-utils 
sudo apt-get install -y tk-dev 
sudo apt-get install -y libffi-dev
sudo apt-get install -y zlib1g-dev

#pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo '
    # Pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    ' >> ~/.bash_profile
source ~/.bash_profile
hash

#Install Python
pyenv install 2.7.8
pyenv install 3.6.0
pyenv shell 2.7.8