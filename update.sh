#!/bin/bash

# go to git directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# pull repository & update submodules
git pull
git submodule update --init --recursive

# update
cd $HOME
rcup
