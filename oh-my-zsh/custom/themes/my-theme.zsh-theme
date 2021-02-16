# my-theme:

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

PROMPT="$(user_and_host) %{$fg[blue]%}%~ %{$reset_color%}➜  "
