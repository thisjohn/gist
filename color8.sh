#!/usr/bin/env bash

function print_colors {
    printf "$3\n"
    for i in $(seq $1 $2); do
        printf "\e[0;${i}m color%3d   \e[0m" ${i}
    done
    printf "\n\n"
}

printf "8 color\n"

print_colors 30 37 "foreground (default 39)"
print_colors 90 97 "light foreground"

print_colors 40 47 "background (default 49)"
print_colors 100 107 "light background"
