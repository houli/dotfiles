#!/bin/zsh
read -q "REPLY?Install personal bits too? "
echo

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew bits
brew install mas
brew bundle

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
touch ~/.hushlogin

cat zsh/zshrc.sh >> ~/.zshrc

# Stow dotfiles
stow emacs git ssh tmux vim

# Setup iTerm
open iterm/Dracula.itermcolors
cp -f iterm/com.googlecode.iterm2.plist ~/Library/Preferences
defaults read com.googlecode.iterm2

# Setup spacemacs
git clone https://github.com/syl20bnr/spacemacs --branch develop ~/.emacs.d
brew linkapps emacs-mac
defaults write org.gnu.Emacs TransparentTitleBar DARK

# Personal stuff below
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew bundle --file=Brewfile.personal

    cat zsh/zshrc-personal.sh >> ~/.zshrc

    # Ruby
    eval "$(rbenv init -)"
    rbenv install 2.4.1
    rbenv global 2.4.1
    gem install bundler

    # Node
    mkdir ~/.nvm
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"
    nvm install stable
    npm install -g bower eslint js-beautify npm pulp tern

    # Haskell
    stack setup
    stack install ghc-mod hindent hlint hoogle pointfree pointful stylish-haskell
    stow ghc
fi

# Keeping this here as reference
# zstyle ':prezto:load' pmodule \
#   'environment' \
#   'terminal' \
#   'editor' \
#   'history' \
#   'directory' \
#   'spectrum' \
#   'utility' \
#   'completion' \
#   'homebrew' \
#   'osx' \
#   'git' \
#   'syntax-highlighting' \
#   'history-substring-search' \
#   'autosuggestions' \
#   'prompt'
