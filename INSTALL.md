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
pbcopy < ~/.ssh/id_rsa.pub
cd ~
mkdir dotfiles
brew install nginx
sudo cp /usr/local/opt/nginx/*.plist /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/homebrew.mxcl.nginx.plist
mkdir -p ~/dotfiles/src
touch ~/dotfiles/src/alias.sh
echo "alias nginx.start='sudo launchctl load /Library/LaunchAgents/homebrew.mxcl.nginx.plist'" >> ~/dotfiles/src/alias.sh
echo "alias nginx.stop='sudo launchctl unload /Library/LaunchAgents/homebrew.mxcl.nginx.plist'" >> ~/dotfiles/src/alias.sh
echo "alias nginx.restart='nginx.stop && nginx.start'" >> ~/dotfiles/src/alias.sh
```

