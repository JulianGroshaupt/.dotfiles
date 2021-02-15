#!/bin/bash

# go to git directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# pull repository
git pull

# update
rcup

# create local-dotfiles
./create_locals.sh
