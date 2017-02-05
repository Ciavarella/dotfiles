# Dotfiles

Fork of [nicknissi's dotfiles](https://github.com/nicknissi/dotfiles)

Contains configuration for zsh, tmux, nvim etc.

## Installation

For macOS you need to install the XCode CLI tools. 

```bash
xcode-select --install
```

Then clone the repo. Symbolic links will be created and therefore location does not matter.

```bash
git clone https://github.com/ludviglundgren/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Neovim

Install neovim plugins with

```bash
:InstallPlug
```

### Generall vim usage

Nerdtree usage:

Shift + i to toggle hidden files.

Leader = ,

## Tmux

Leader = ctrl+a

### Aliases for tmux

```bash
tm = list sessions or create new

ta = tmux attach
tls = tmux ls
tat = tmux attatch -t
tns = tmux new-session -s
```

## zsh

Install terminfo profiles

```bash
tic xterm-256-italic.terminfo
tic tmux-256-italic.terminfo

export TERM=tmux-256color-italic
export TERM=xterm-256color-italic
```

ZSH from Homebrew uses another path then standard.
To add zsh from homebrew add `/usr/local/bin/zsh` to `/etc/shells` with command
[Source](http://stackoverflow.com/questions/1276703/how-to-make-zsh-run-as-a-login-shell-on-mac-os-x-in-iterm/35762726#35762726)

```bash
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells" && chsh -s /usr/local/bin/zsh
```

Zplug usage

```bash
zplug install
```
### Node

Install node from nvm. This install latest version.

```bash
nvm install node
```
