#!/bin/bash

for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}  \x1b[48;5;${i}m colour${i} \e[0m\n"
done
