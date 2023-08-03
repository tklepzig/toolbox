alias toolbox-update='/usr/bin/env zsh -c "$(curl -Ls https://raw.githubusercontent.com/tklepzig/toolbox/master/install.sh)"'
alias tbu='toolbox-update'
alias tb="cd $toolboxDir && v \$(fzf) && cd -"
alias tbs="$toolboxDir/docs/_serve.sh"

#TODO auto-generate aliases for tools
alias tb-v="$toolboxDir/tools/vicy/vicy.sh"
alias tb-vs="cd $toolboxDir/tools/vicy && npm start && cd -"
