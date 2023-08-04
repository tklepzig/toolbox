#!/usr/bin/env zsh

# source this file in zshrc
# (important: use source, not ./ to avoid subshell which won't register the completion at all)
cmds=( $(./blubb.rb --list) )

function blubb_completion {
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

	cmd=$(./blubb.rb $args)
	[ $? -ne 0 ] && echo "$cmd" || eval $cmd
}

