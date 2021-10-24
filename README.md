# .dofiles

This repository holds my dotfiles and oh-my-zsh customization.

## required packages

you need to install the following packages to use this dotfiles to their full extent

* git
* vim
* rcm ([see here](https://github.com/thoughtbot/rcm#installation))
* tmux
* zsh (as the users default shell)
* oh-my-zsh ([see here](https://github.com/ohmyzsh/ohmyzsh)) installed to ```$HOME/.oh-my-zsh```

## install

you can automatically install this repository with all dependencies by running the following command (requires curl to be installed):

```bash -c "$(curl -fsSL https://raw.githubusercontent.com/JulianGroshaupt/.dotfiles/main/install.sh)"```

or you can download the installation script and then run it (requires wget to be installed):

1. with wget: ```wget https://raw.githubusercontent.com/JulianGroshaupt/.dotfiles/main/install.sh```
2. make executeable: ```chmod +x install.sh```
3. run it: ```./install.sh```

### manual installation

alternatively you can install it all on your own, following the steps below:

1. install required packages (see above)
2. clone this repository (to ```$HOME/.dotfiles```)
3. update your default shell with ```chsh -s /bin/zsh```
4. run command ```RCRC=$HOME/.dotfiles/rcrc rcup```

## update

1. run update.sh

## .local-dotfiles

you can create the following files in your home-directory, that will automatically be "sourced" if they exist

* ~/.aliases.local
* ~/.exports.local

## oh-my-zsh custom folder

* everything inside the ```oh-my-zsh/custom``` folder of this repository will be linked to the custom folder inside your oh-my-zsh installation (````$HOME/.oh-my-zsh/custom````)
* you need to remove the symbolic link to update oh-my-zsh

## sources

* https://github.com/thoughtbot/rcm
* https://thoughtbot.com/upcase/videos/manage-and-share-your-dotfiles-with-rcm

## license

MIT License, see [LICENSE](https://github.com/JulianGroshaupt/.dotfiles/blob/main/LICENSE)
