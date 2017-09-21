#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "Installing dotfiles."

source install/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh

    source install/fonts.sh

    source install/osx.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s /usr/local/bin/zsh
fi

echo "Done. Reload your terminal."
