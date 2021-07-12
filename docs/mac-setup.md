## NodeJS
- trash-cli

## System Preferences
```
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
killall Dock # Restart the Dock process
```

## Xcode
Download Xcode - https://developer.apple.com/xcode/
Install Xcode command line tools
```
xcode-select --install
```

## Brew cask


## System
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install node
brew install nvm
brew install git
brew install openvpn
brew install yarn
npm i -g typescript ts-node react-devtools trash-cli prettier nodemon node-sass

brew install --cask \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzip \
    webpquicklook \
    suspicious-package

brew install --cask \
    bettertouchtool \
    cheatsheet \
    docker \
    firefox-developer-edition \
    dropbox \
    neovim \
    google-chrome \
    1password \
    visual-studio-code \
    sublime-text \
    flipper \
    onyx \
    transmission \
    iterm2 \
    slack \
    vlc
```

## iTerm settings
import JSON profile

## Finder
Enable path bar in Finder
```
defaults write com.apple.finder ShowPathbar -bool true
```

## Symlinks
ln -s ~/git/dot-files/config/.vimrc ~/.vimrc
ln -s ~/git/dot-files/config/.vim ~/.vim
vi +PlugInstall +qall

ln -s ~/git/dot-files/config/.zshrc ~/.zshrc
