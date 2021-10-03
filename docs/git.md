# Git

### Find deleted file in history

If you know the exact path

    git lna --full-history -- path/to/file

If you only know some parts

    git lna --full-history -- **/thefile.*

Restore the file

    g show <SHA>:./path/to/file

> Alternatives
>
>     g cat-file -p <SHA>:./path/to/file
>     git checkout <SHA> -- path/to/file
