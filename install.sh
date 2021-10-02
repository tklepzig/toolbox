#!/bin/bash

set -e
toolboxDir=$HOME/.toolbox

source <(curl -Ls https://raw.githubusercontent.com/tklepzig/toolbox/master/logger.sh)

isProgramInstalled()
{
    command -v $1 >/dev/null 2>&1 || { return 1 >&2; }
    return 0
}

info "Searching for Git..."
if ! isProgramInstalled git
then
  error "No Git found!"
  exit
fi
success "Git found: $(which git)."

info "Cloning Repo..."
rm -rf $toolboxDir
git clone --depth=1 https://github.com/tklepzig/toolbox.git $toolboxDir > /dev/null 2>&1
success "Done."
