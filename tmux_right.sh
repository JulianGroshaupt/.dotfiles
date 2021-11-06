#!/usr/bin/env bash

# check os type
if [[ $OSTYPE == linux* ]]; then
	HOSTCOLOR=green
elif [[ $OSTYPE == darwin* ]]; then
	HOSTCOLOR=yellow
	BATTERYLEVEL=true
else
	HOSTCOLOR=white
fi

# set output
OUTPUT=""

# add date
OUTPUT="$OUTPUT #[fg=colour202]#[bg=colour202]#[fg=colour0] $(date +'%a %d.%m.%Y %H:%M')"

# add battery
if [[ $BATTERYLEVEL ]]; then
    OUTPUT="$OUTPUT #[fg=colour110]#[bg=colour110]#[fg=colour0] $(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)%"
fi

# add hostname
OUTPUT="$OUTPUT #[fg=$HOSTCOLOR]#[bg=$HOSTCOLOR]#[fg=colour0] $(hostname -s)"

# echo output
echo $OUTPUT
