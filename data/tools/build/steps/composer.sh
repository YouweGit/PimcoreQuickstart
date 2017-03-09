#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

# install application dependencies in /vendor via Composer
headline "Checking composer dependencies ..."

execute cd $PROJECT_DIR

if [ ! -f ./composer.phar ]
then
    # download the latest composer.phar in the current directory
    echo "php -r \"readfile('https://getcomposer.org/installer');\" | php"
    php -r "readfile('https://getcomposer.org/installer');" | php
fi

execute chmod +x composer.phar
execute php composer.phar self-update
execute php composer.phar install

execute cd $BUILD_DIR

exit 0
