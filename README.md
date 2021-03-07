# .dofiles

This repository holds my dotfiles and oh-my-zsh customization.

## required packages

you need to install the following packages to use this dotfiles to their full extent

* git
* vim
* rcm ([see here](https://github.com/thoughtbot/rcm#installation))
* zsh (as the users default shell)
* oh-my-zsh ([see here](https://github.com/ohmyzsh/ohmyzsh)) installed to ```$HOME/.oh-my-zsh```

## install

1. install required packages (see above)
2. clone this repository (to ```$HOME/.dotfiles```)
3. run install.sh

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
