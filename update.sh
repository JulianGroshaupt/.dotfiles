#!/bin/bash

# go to git directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# pull repository
git pull

# update
rcup

# copy oh-my-zsh custom folder
if [ -d "$ZSH" ]; then
    cp -r oh-my-zsh/custom/* $ZSH/custom/
fi
