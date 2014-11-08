#!/bin/bash

set -e

dir="$(dirname $0)"

if [[ $1 = "install" ]]; then
    brew install nginx || true
fi

sudo cp -f /usr/local/opt/nginx/*.plist /Library/LaunchAgents/ || true
sudo chmod 644 /Library/LaunchAgents/homebrew.mxcl.nginx.plist

mkdir -p /usr/local/log/nginx
mkdir -p /usr/local/var/run/nginx
sudo mkdir -p /usr/local/var/run/nginx
sudo chmod -R 0777 /usr/local/log

cp -fr $dir/../etc/nginx/* /usr/local/etc/nginx/

sed -i '' "s#__ROOT__#$HOME\/Development\/server;#g" /usr/local/etc/nginx/sites/default

sudo nginx -t

sudo launchctl load /Library/LaunchAgents/homebrew.mxcl.nginx.plist || true

code=$(curl -sL -w "%{http_code}" 127.0.0.1/php55 -o /dev/null)

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
