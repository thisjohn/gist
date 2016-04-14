#!/usr/bin/env bash

for x in 38 48; do  # foreground / background
    printf "256 color - %2d\n" ${x}

    # 256 color, ex: \e[38;5;32mtext\e[0m
    for i in {0..255}; do
        printf "\e[${x};5;${i}mcolor%3d   \e[0m" ${i}

        [ $(((${i} + 1) % 10)) == 0 ] && printf "\n"
    done
    printf "\n\n"
done
