# read aliases
source ~/.aliases
if [ -f ~/.aliases.local ]; then
    source ~/.aliases.local
fi
  
# read exports
source ~/.exports
if [ -f ~/.exports.local ]; then
    source ~/.exports.local
fi

# oh-my-zsh setup
if [[ "$SHELL" == *zsh ]]; then 
    # update the path to your oh-my-zsh installation here
    export ZSH="$HOME/.oh-my-zsh"

    # update the theme here
    ZSH_THEME="my-theme"

    # update list of plugins here
    plugins=(
	cargo
	docker
	docker-compose
	git
	rust
	rustup
	zsh-autosuggestions
	zsh-syntax-highlighting
    )

    # plugin-specific configurations
    zstyle ':completion:*:*:docker:*' option-stacking yes
    zstyle ':completion:*:*:docker-*:*' option-stacking yes

    # load oh-my-zsh
    source $ZSH/oh-my-zsh.sh
fi
