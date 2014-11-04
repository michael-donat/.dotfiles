```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install caskroom/cask/brew-cask
brew cask install iterm2
open ~/Applications/iTerm.app
brew install git
ssh-keygen -t rsa -C "`whoami`"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

