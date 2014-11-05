#!/bin/bash

set -e

dir="$(dirname $0)"

version=$1

if [[ -z "$version" ]]; then
    echo 'Usage: ./php version install';
    exit 1;
fi

if [[ $version = '55' ]]; then
    ./$dir/php/install.sh 55 5.5 $2
else
    ./$dir/php/install.sh 56 5.6 $2
fi;

