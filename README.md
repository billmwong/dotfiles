Scripts to setup dev environment.

# Terminal and zsh
* Download iTerm from https://iterm2.com/
* Make sure keyboard shortcuts for next/previous/open/close tab work (should be in BTT)
* *In home directory:
```sh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh

git clone https://github.com/billmwong/dotfiles.git
echo "source $HOME/dotfiles/.zshrc" >> ~/.zshrc
chsh -s /bin/zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fzf
```
* Open iTerm, go to menubar > iTerm2 > Install Shell Integration
* Remove any excess auto-loaded things in .zshrc. It should look like this:
```
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source $HOME/dotfiles/.zshrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

# Git
* Install git in some way. I think this comes with our zsh setup now, but if not you can run `sudo apt-get -y install git git-core` on linux.
* Run these commands:
```sh
git config --global user.email "billmwong@gmail.com"
git config --global user.name "Bill Wong"
git config --global core.editor "vi"
git config --global push.default "current"

ssh-keygen -t rsa -b 4096 -C "billmwong@gmail.com"

brew install diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
```

# Vim
```sh
brew install the_silver_searcher
brew install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install cmake
echo "source $HOME/dotfiles/.vimrc" >> ~/.vimrc
curl -O https://raw.githubusercontent.com/billmwong/dotfiles/master/.vimrc
vim +PlugInstall
```

# Old Scripts
Run in this order:
```sh
bash setup-git
bash setup-js
bash setup-zsh
bash setup-vim
bash setup-python
```
