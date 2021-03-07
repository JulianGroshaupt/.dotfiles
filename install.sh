#!/bin/bash

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_C='\033[0m'

# start message
echo "[i]  installing dotfiles and oh-my-zsh from Julian Groshaupt" 
echo "[i]  github: https://github.com/JulianGroshaupt/.dotfiles"
echo

# go to home directory
cd $HOME

# install dependencies
echo "[i]  installing dependencies (this might take a while)"
if [[ $OSTYPE == linux* ]]; then
    sudo apt update > /dev/null 2>&1 ||{
        echo -e "${RED}[!]  error updating apt sources"
        exit 1
    }
    sudo apt upgrade -y > /dev/null 2>&1 ||{
        echo -e "${RED}[!]  error upgrading apt packages"
        exit 1
    }
    sudo apt install -y git vim rcm zsh > /dev/null 2>&1 ||{
	echo -e "${RED}[!]  error installing dependencies"
	exit 1
    }
elif [[ $OSTYPE == darwin* ]]; then
    brew install git vim rcm zsh > /dev/null 2>&1 ||{
	echo -e "${RED}[!]${NO_C}  error installing dependencies"
	exit 1
    }
else
    echo -e "${RED}[!]${NO_C}  unknown os - please install manually"
    exit 2
fi
echo -e "${GREEN}[ok]${NO_C} installed dependencies"
echo

# clone .dotfiles & update submodules
echo "[i]  cloning .dotfiles repository (and submodules)"
git clone https://github.com/JulianGroshaupt/.dotfiles.git > /dev/null 2>&1 ||{
    echo -e "${RED}[!]${NO_C}  error cloning .dotfiles repository" 
    exit 3
}
cd $HOME/.dotfiles
git submodule update --init --recursive > /dev/null 2>&1 ||{
    echo -e "${RED}[!]${NO_C}  error updating submodules"
    exit 3
}
echo -e "${GREEN}[ok]${NO_C} repositories cloned"
echo

# set default shell to zsh
echo "[i]  changing default shell to zsh"
chsh -s /bin/zsh ||{
    echo -e "${RED}[!]  error updating the users default shell - please try it again manually"
}
echo -e "${GREEN}[ok]${NO_C} your default shell is now set to zsh"
echo

# install oh-my-zsh
cd $HOME
echo "[i]  installing oh-my-zsh (this might take a while)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --skip-chsh --unattended" > /dev/null 2>&1 ||{
    echo -e "${RED}[!]${NO_C}  error installing oh-my-zsh"
}
echo -e "${GREEN}[ok]${NO_C} installed oh-my-zsh"
echo

# link dotfiles
echo "[i]  linking dotfiles"
echo "[i]  - if you receive a message to overwrite some existing files press 'y' if you do not need the files anymore"
echo "[i]  - the following files can be safely overwritten (without backuping or loosing something): .zshrc .oh-my-zsh/custom"
RCRC=$HOME/.dotfiles/rcrc rcup
echo -e "${GREEN}[ok]${NO_C} setup finished - restart your terminal or logoff and login again"
