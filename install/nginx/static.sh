#!/bin/sh

dir=$(dirname $0)

directory=$1
domain=$2

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage ./static.sh ROOT DOMAIN";
    exit 1
fi

cp -f $dir/../../etc/sites/static.conf /usr/local/etc/nginx/sites/$directory.conf

sed -i '' "s#__ROOT__#$HOME\/Development\/$directory#g" /usr/local/etc/nginx/sites/$directory.conf
sed -i '' "s#__DOMAIN__#$domain#g" /usr/local/etc/nginx/sites/$directory.conf
sed -i '' "s#__LOG__#$directory#g" /usr/local/etc/nginx/sites/$directory.conf