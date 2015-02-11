#!/bin/bash

set -e

dir="$(dirname $0)"

if [[ $1 = "install" ]]; then
    brew install mysql || true
fi

rm -f ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
cp -f `brew --prefix mysql`/*.plist ~/Library/LaunchAgents/

cat << EOF > `brew --prefix`/etc/my.cnf
[mysqld]
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

skip-external-locking

key_buffer          = 16M
max_allowed_packet  = 16M
thread_stack        = 192K
thread_cache_size   = 8

myisam-recover         = BACKUP

query_cache_limit   = 1M
query_cache_size    = 16M

query-cache-type = 1

default-storage-engine=innodb

default_time_zone='+00:00'
EOF


launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist || true
sleep 2;

launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist || true

sleep 2;

if [ -e /tmp/mysql.sock ];then
    echo '=========================';
    echo '=========================';
    echo 'All good to go';
    echo '=========================';
    exit 0;
else
    echo 'Mysql not responding';
    exit 1;
fi
