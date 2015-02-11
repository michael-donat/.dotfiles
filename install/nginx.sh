#!/bin/bash

set -e

dir="$(dirname $0)"

if [[ $1 = "install" ]]; then
    brew tap homebrew/nginx || true
    brew install nginx-full --with-status || true
fi

sudo cp -f `brew --prefix nginx-full`/*.plist /Library/LaunchAgents/ || true
sudo chmod 644 /Library/LaunchAgents/homebrew.mxcl.nginx-full.plist

mkdir -p /usr/local/log/nginx
mkdir -p /usr/local/var/run/nginx
sudo mkdir -p /usr/local/var/run/nginx
sudo chmod -R 0777 /usr/local/log

cp -fr $dir/../etc/nginx/* /usr/local/etc/nginx/

sed -i '' "s#__ROOT__#$HOME\/usr\/local\/var\/www;#g" /usr/local/etc/nginx/sites/default

sudo nginx -t

sudo launchctl unload /Library/LaunchAgents/homebrew.mxcl.nginx-full.plist || true
sudo launchctl load /Library/LaunchAgents/homebrew.mxcl.nginx-full.plist || true

sleep 2;

code=$(curl -sL -w "%{http_code}" 127.0.0.1/status -o /dev/null || true)

if [[ $code = 200 ]];then
    echo '=========================';
    echo '=========================';
    echo 'All good to go';
    echo '=========================';
    exit 0;
else
    echo 'Nginx not responding';
    exit 1;
fi
