Find key code for binding:

<kbd>Ctrl</kbd>+<kbd>v</kbd> KEY

or run

    cat -v

and press the desired key(s)

Home, End and Delete does not work as expected? -> Add the following to `.zshrc`:

    bindkey '\e[H'  beginning-of-line
    bindkey '\e[F'  end-of-line
    bindkey '\e[3~' delete-char

    # inside tmux the keycodes differ for whatever reason...
    bindkey '\e[1~'  beginning-of-line
    bindkey '\e[4~'  end-of-line
