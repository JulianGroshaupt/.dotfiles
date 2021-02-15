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
