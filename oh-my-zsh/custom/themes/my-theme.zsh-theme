### my-theme ###

# user@host
user_and_host() {
    if [[ $OSTYPE == linux* ]]; then
	USERANDHOSTCOLOR=green
    elif [[ $OSTYPE == darwin* ]]; then
	USERANDHOSTCOLOR=yellow
    else
	USERANDHOSTCOLOR=white
    fi

    echo "%{$fg[$USERANDHOSTCOLOR]%}%n@%m"
}

# prompt
PROMPT="$(user_and_host) %{$fg[blue]%}%~ %{$reset_color%}➜  "

# right prompt
RPROMPT='$(git_prompt_info)'

# zsh git settings
ZSH_THEME_GIT_PROMPT_PREFIX="\ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
