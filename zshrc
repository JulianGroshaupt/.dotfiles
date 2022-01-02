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
	docker
	docker-compose
	flutter
	git
	rust
	rustup
	tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
    )

    # plugin-specific configurations
    zstyle ':completion:*:*:docker:*' option-stacking yes
    zstyle ':completion:*:*:docker-*:*' option-stacking yes

    # setup oh-my-zsh tmux
    : ${ZSH_TMUX_AUTOSTART:=true}

    # setup oh-my-zsh updates
    : ${DISABLE_UPDATE_PROMPT:=true}
    : ${DISABLE_AUTO_UPDATE:=true}

    # load oh-my-zsh
    source $ZSH/oh-my-zsh.sh
fi
