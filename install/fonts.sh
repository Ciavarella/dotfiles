#!/bin/sh

brew tap caskroom/fonts

fonts=(
    font-hack-nerd-font
    font-hack-nerd-font-mono
    font-firacode-nerd-font-mono
    font-firacode-nerd-font
    font-firamono-nerd-font-mono
    font-firamono-nerd-font
    font-ubuntumono-nerd-font-mono
    font-ubuntumono-nerd-font
    font-sourcecodepro-nerd-font-mono
    font-sourcecodepro-nerd-font
    font-droidsansmono-nerd-font-mono
    font-droidsansmono-nerd-font
    font-dejavusansmono-nerd-font-mono
    font-dejavusansmono-nerd-font
)

for font in "${fonts[@]}"; do
    if brew list "$font" > /dev/null 2>&1; then
        echo "$font aldready installed... skipping."
    else
        brew cask install $font
    fi
done
