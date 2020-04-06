#!/bin/bash

# Add proper keys to .ssh ssh-add
ssh-add

# Install Firefox, iTerm2, Docker, Magnet, 1Password, Amphetamine

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install mc
brew install jq
brew install node
brew install vim
brew install coreutils
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/workspace/dotfiles/.gitconfig .gitconfig
ln -s ~/workspace/dotfiles/.vimrc .vimrc
ln -s ~/workspace/dotfiles/.zshenv .zshenv
ln -s ~/workspace/dotfiles/.zshenv-custom .zshenv-custom
ln -s ~/workspace/dotfiles/.zshrc .zshrc
ln -s ~/workspace/dotfiles/.vim .vim
ln -s ~/workspace/dotfiles/z.sh z.sh
cp ~/workspace/dotfiles/.oh-my-zsh/custom/cdimascio-lambda.zsh-theme ~/.oh-my-zsh/custom/ 

# Install custom zsh plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions
cd

# Fonts: import from fonts
cp ~/workspace/dotfiles/fonts.zip ~/Downloads

# iTerm2: import .itermcolors theme
cp -r ~/workspace/dotfiles/wallpapers ~/Downloads

# Screensaver: import from wallpapers
cp ~/workspace/dotfiles/Monokai_Vivid.itermcolors ~/Downloads

sudo chsh -s /bin/zsh

rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
asdf plugin add java
asdf plugin add scala
asdf plugin add sbt

asdf install java adopt-openjdk-11.0.6+10
asdf install scala 2.12.11
asdf install scala 2.13.1
asdf install sbt 1.3.8

asdf global java adopt-openjdk-11.0.6+10
asdf global scala 2.12.11
asdf global sbt 1.3.8

