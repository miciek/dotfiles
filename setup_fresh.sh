#!/bin/bash
set -ex

cat << EOF
Before continuing:
 1. move .zsh_history and .ssh from another computer
 2. install iTerm2, Magnet, 1Password, Flux, brew, git, and others from App Store
 3. install Firefox (Sync + import settings),
 4. move the Firefox profile from another computer (or from Documents/backups)
 5. Mac Settings -> Keyboard Key Repeat=Fast, Delay=Short;
 6. Mac Settings -> Mouse Tracking Speed=Fast, Secondary Click=Click Right Side, Smart Zoom
 7. Mac Settings -> Size=Small, Magnification=Medium, Auto hide=on, Auto rearrange=off, Group by app=on
 8. Mac Settings -> Keyboard -> Input Sources (Polish/ABC) -> Show in menu=on, Auto switch=on, Correct Spelling=on, Captialise words=off
 9. Mac Settings -> iCloud -> iCloud Drive -> Desktop & Documents folders=on
 9. iTerm2 Settings -> Profiles -> Import JSON profiles (iTerm2-profile.json)
10. iTerm2 Settings -> Appearance -> General -> Theme=minimal
11. iTerm2 Settings -> Profiles -> Terminal -> Unlimited scrollback

When in zsh, remember to exit from it so that the script can continue
After finishing, look at the Downloads folder to see more import options.

After installing neovim, remember to :PlugInstall on the first run.
EOF

read -p "Press enter to continue"


# Add proper keys to .ssh
ssh-add

# Create local bin directory (install all tools there or through asdf)
mkdir -p ~/.local/bin

# Create local config directory
mkdir -p ~/.config

brew install mc
brew install jq
brew install vim
brew install htop
brew install coreutils
brew install zsh zsh-completions
brew install watch
brew install automake libtool

# oh-my-zsh (remember to exit zsh to continue the setup)
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/workspace/dotfiles/.oh-my-zsh/custom/cdimascio-lambda.zsh-theme ~/.oh-my-zsh/custom/ 

# config files
cd
rm -rf ~/.gitconfig ~/.vimrc ~/.zshenv ~/.zshrc ~/.vim ~/.z.sh ~/.selected-editor ~/.zshenv-custom 
ln -sf ~/workspace/dotfiles/.gitconfig .gitconfig
ln -sf ~/workspace/dotfiles/.vimrc .vimrc
ln -sf ~/workspace/dotfiles/.zshenv .zshenv
ln -sf ~/workspace/dotfiles/.zshrc .zshrc
ln -sf ~/workspace/dotfiles/.vim .vim
ln -sf ~/workspace/dotfiles/.z.sh .z.sh
ln -sf ~/workspace/dotfiles/.selected_editor .selected_editor
ln -sf ~/workspace/dotfiles/nvim ~/.config/nvim

cp ~/workspace/dotfiles/.zshenv-custom .zshenv-custom # this is local to the workstation (aliases, PATHs)

# Install custom zsh plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions
cd

# Install nvim (remember to run :PlugInstall on the first vim run!)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install cht.sh
curl https://cht.sh/:cht.sh > ~/.local/bin/cht.sh
chmod +x ~/.local/bin/cht.sh

# Fonts: import from fonts (more fonts in Documents/backups/fonts)
cp ~/workspace/dotfiles/fonts.zip ~/Downloads

# Screensaver: import from wallpapers
cp -r ~/workspace/dotfiles/wallpapers ~/Downloads

# IntelliJ: import settings from intellij
cp -r ~/workspace/dotfiles/intellij ~/Downloads

# Change default shell to zsh
sudo chsh -s /bin/zsh

# Install asdf and tools
rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
. "$HOME/.asdf/asdf.sh" # should also be in .zshrc / .bashprofile
asdf plugin add java
asdf plugin add scala
asdf plugin add sbt
asdf plugin add python
asdf plugin add nodejs
asdf plugin-add ruby

asdf install java zulu-11.62.17
asdf install java openjdk-17
asdf install scala 2.13.10
asdf install scala 3.2.2
asdf install sbt 1.8.3
asdf install python 3.9.10
asdf install nodejs 16.17.0
asdf install ruby 3.2.2

asdf global java openjdk-17
asdf global scala 3.2.2
asdf global sbt 1.8.3
asdf global python 3.9.10
asdf global nodejs 16.17.0
asdf global ruby 3.2.2

# temporarily brew (can be changed to asdf hopefully)
brew install coursier/formulas/coursier
brew install wget
brew install rg
brew install nvim

# Install virtual env locally (in ~/.local/bin)
python -m pip install --upgrade pip
python -m pip install --user virtualenv

# Install jekyll
sudo gem install jekyll
