#!/bin/bash

set -e

dir="$(dirname $0)"

version=$1
versionDotted=$2

if [[ $3 = "install" ]]; then
    brew install php$version --with-homebrew-openssl --with-homebrew-curl --with-fpm --with-gmp --without-snmp || true
    brew install php$version-xdebug || true
    brew install php$version-mcrypt || true
    brew install php$version-memcached || true
fi

cp -f /usr/local/opt/php$version/*.plist ~/Library/LaunchAgents/ || true

sudo mkdir -p /var/log/php/
sudo chmod -R 0777 /var/log/php/

mkdir -p /usr/local/etc/php/$versionDotted/conf.d
mkdir -p /usr/local/etc/php/$versionDotted/fpm.d

cp -fr $dir/../../etc/php/$versionDotted/* /usr/local/etc/php/$versionDotted/

ls -al /usr/local/etc/php/$versionDotted/

sed -i '' "/include=\/usr\/local\/etc\/php\/$versionDotted\/fpm.d/d" /usr/local/etc/php/$versionDotted/php-fpm.conf

echo "include=/usr/local/etc/php/$versionDotted/fpm.d/*.conf" >> /usr/local/etc/php/$versionDotted/php-fpm.conf

brew unlink php$version && brew link php$version

php-fpm -t

launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php$version.plist

sleep 2

nc -z 127.0.0.1 90$version || {
    error=1
}

if [[ $error = 1 ]];then
    echo 'PHP not responding';
    exit 1;
else
    echo '=========================';
    echo '=========================';
    echo 'All good to go';
    echo '=========================';
    exit 0;
fi;

