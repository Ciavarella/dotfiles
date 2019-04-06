#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    # flags should pass through the the `brew list check`
    diff-so-fancy
    ack
    docker
    git
    hub
    fzf
    markdown
    nvm
    reattach-to-user-namespace
    the_silver_searcher
    tmux
    tree
    wget
    yarn --without-node
    zsh
    z
    Caskroom/cask/alfred
    Caskroom/cask/iterm2
    Caskroom/cask/caffeine
    Caskroom/cask/dashlane
    Caskroom/cask/virtualbox
    Caskroom/cask/google-chrome
    Caskroom/cask/firefox-developer-edition
    Caskroom/cask/spotify
    Caskroom/cask/slack
    Caskroom/cask/the-unarchiver
    Caskroom/cask/vlc
    Caskroom/cask/visual-studio-code
    Caskroom/cask/goofy
    Caskroom/cask/gitkraken
    Caskroom/cask/sequel-pro
    Caskroom/cask/postman
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
