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
mkdir -p /usr/local/log/nginx
chmod 0777 -R /usr/local/log
mkdir -p /usr/local/etc/nginx/sites/
cat << EOF > /usr/local/etc/nginx/nginx.conf
worker_processes  1;

error_log  /usr/local/log/nginx/error.log debug;

events {
    worker_connections  1024;
}

http {
    include             mime.types;
    default_type        application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';



    access_log  /usr/local/log/nginx/access.log  main;

    sendfile            on;

    keepalive_timeout   65;

    index index.html index.php app.php;

    include /usr/local/etc/nginx/sites/*;
}
EOF

```
