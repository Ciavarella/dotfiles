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
    git
    hub
    fzf
    markdown
    neovim/neovim/neovim
    reattach-to-user-namespace
    the_silver_searcher
    tmux
    tree
    wget
    zsh
    z
    Caskroom/cask/iterm2
    Caskroom/cask/macdown
    Caskroom/cask/spectacle
    Caskroom/cask/flux
    Caskroom/cask/caffeine
    Caskroom/cask/bartender
    Caskroom/cask/dropbox
    Caskroom/cask/virtualbox
    Caskroom/cask/transmission
    Caskroom/cask/imageoptim
    Caskroom/cask/google-chrome
    Caskroom/cask/cyberduck
    Caskroom/cask/mountain-duck
    Caskroom/cask/skype
    Caskroom/cask/spotify
    Caskroom/cask/slack
    Caskroom/cask/the-unarchiver
    Caskroom/cask/vlc
    Caskroom/cask/visual-studio-code
    Caskroom/cask/goofy
    Caskroom/cask/clipmenu
    Caskroom/cask/gitkraken
    Caskroom/cask/sequel-pro
    Caskroom/cask/postman
    Caskroom/cask/sublime-text
    Caskroom/cask/webtorrent
    Caskroom/cask/ealeksandrov-cd-to
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
