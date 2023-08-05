#!/usr/bin/env zsh

# source this file in zshrc
# (important: use source, not ./ to avoid subshell which won't register the completion at all)
cmds=( $(./blubb.rb --list) )

# Discarded idea: Add descriptions to completion
## ${(f)...} --> parameter expansion, split at new lines
#descs=( ${(f)"$(./blubb.rb --descs)"} )

function blubb_completion {
	#compadd -d descs -a cmds
	compadd -a cmds
}

compdef blubb_completion \#

function \# {
	if [ $# -eq 0 ]
	then
		args=$(printf "%s\n" "${cmds[@]}" | fzf | awk '{print $1}')
	else
		args=( $@ )
	fi

  # TODO add option to run ruby scripts (e.g. having type: ruby in yaml)
	cmd=$(./blubb.rb $args)
	[ $? -ne 0 ] && echo "$cmd" || eval $cmd
}

