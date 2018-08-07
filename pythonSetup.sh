#! /bin/bash

if [ "$(uname)" == "Darwin" ]; then
    if [ `which pyenv` ]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
    pyenv install -v 3.7.0
    pyenv global 3.7.0
    pip install --upgrade pip
    pip install requests numpy pybitflyer ccxt flake8 Flask pandas vim-vint
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo 'windows'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ `which git` ]; then
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
        echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
        sudo apt-get -y install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev
        pyenv install -v 3.7.0
        pyenv global 3.7.0
        pip install --upgrade pip
        pip install requests numpy pybitflyer ccxt flake8 Flask pandas vim-vint
    fi
fi
