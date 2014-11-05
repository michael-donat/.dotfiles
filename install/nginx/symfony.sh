#!/bin/sh

dir=$(dirname $0)

directory=$1
domain=$2
version=$3

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
    echo "Usage ./symfony.sh ROOT DOMAIN VERSION";
    exit 1
fi

cp -f $dir/../../etc/sites/symfony.conf /usr/local/etc/nginx/sites/$directory.conf

sed -i '' "s#__ROOT__#$HOME\/Development\/$directory#g" /usr/local/etc/nginx/sites/$directory.conf
sed -i '' "s#__DOMAIN__#$domain#g" /usr/local/etc/nginx/sites/$directory.conf
sed -i '' "s#__VERSION__#$version#g" /usr/local/etc/nginx/sites/$directory.conf
sed -i '' "s#__LOG__#$directory#g" /usr/local/etc/nginx/sites/$directory.conf