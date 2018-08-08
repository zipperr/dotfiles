#! /bin/bash

if [ "$(uname)" == "Darwin" ]; then
    if [ `which pyenv` ]; then
        while true;do
            echo "Start python3.7.0 install"
            echo "Type 'y' or 'n'"
            read answer
            case $answer in
                y)
                    pyenv install -v 3.7.0
                    pyenv global 3.7.0
                    break
                    ;;
                n)
                    break
                    ;;
                *)
                    echo -e "cannot understand $answer.\n"
                    ;;
            esac
        done
    fi
    if [ `which pip` ]; then
        pip install --upgrade pip
        pip install requests numpy pybitflyer ccxt flake8 Flask pandas vim-vint
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo 'windows'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ `which git` ]; then
        while true;do
            echo "Start python3.7.0 install"
            echo "Type 'y' or 'n'"
            read answer
            case $answer in
                y)
                    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
                    sudo apt-get -y install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev
                    pyenv install -v 3.7.0
                    pyenv global 3.7.0
                    break
                    ;;
                n)
                    break
                    ;;
                *)
                    echo -e "cannot understand $answer.\n"
                    ;;
            esac
        done
    fi
    if [ `which pip` ]; then
        pip install --upgrade pip
        pip install requests numpy pybitflyer ccxt flake8 Flask pandas vim-vint
    fi
fi
