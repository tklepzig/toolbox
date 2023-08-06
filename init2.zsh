#!/usr/bin/env zsh

# source this file in zshrc
# (important: use source, not ./ to avoid subshell which won't register the completion at all)
cmds=( $(./blubb2.rb --list) )

# Discarded idea: Add descriptions to completion
## ${(f)...} --> parameter expansion, split at new lines
#descs=( ${(f)"$(./blubb.rb --descs)"} )

blubb2_completion() {
	#compadd -d descs -a cmds
	compadd -a cmds
}

compdef blubb2_completion \#

\#() {
	if [ $# -eq 0 ]
	then
		args=$(printf "%s\n" "${cmds[@]}" | fzf | awk '{print $1}')
	else
		args=( $@ )
	fi

	cmd=$(./blubb2.rb $args)
	if [ $? -ne 0 ]
	then
		echo "$cmd"
	else
		[ $# -ne 0 ] && shift

		# TODO absolute path
		first_line=$(head -n 1 "./scripts/$cmd")
		[[ $first_line != \#!* ]] && echo "Error: $cmd is missing a proper shebang line" && return 1
		"./scripts/$cmd" $@
	fi
}


# global stuff
isOS()
{
  if [[ "$OSTYPE:l" == *"$1:l"* ]]
  then
    return 0;
  fi

  return 1;
}
