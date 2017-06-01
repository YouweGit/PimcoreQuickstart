#!/bin/sh
CURRENT_PATH=$(cd $(dirname "$0"); pwd)
php ${CURRENT_PATH}/cli.php -a copy-plugin-files-to-project $*

echo .
echo .
echo .  Grabbing capistrano deployment scripts from external git ...
echo .
echo .

git clone --depth=1 --branch=master ssh://git@source.youwe.nl:7999/pimb2b/pimcore-capistrano.git ${CURRENT_PATH}/../../../tools/capistrano
rm -rf ${CURRENT_PATH}/../../../tools/capistrano/.git

echo .
echo .
echo .  Requiring packages ...
echo .
echo .


composer require youwe/pimcore-deployment
composer require youwe/pimcore-fixtures
composer require youwe/pimcore-href-typeahead
composer require youwe/pimcore-object-bridge

composer require youwe/pimcore-object-defaults
composer require youwe/pimcore-quickstart
composer require youwe/pimcore-shop

echo .
echo .
echo .  Running composer update ...
echo .
echo .

composer update

echo .
echo .
echo .  Fixing some executable permissions ...
echo .
echo .


find ${CURRENT_PATH}/../../../ -type f -iname "*.sh" -exec chmod +x {} \;

echo .
echo .
echo .  Running local build
echo .
echo .

/bin/bash ${CURRENT_PATH}/../../../tools/build/local-build.sh

echo .
echo .
echo .  Create pimcore system folders
echo .
echo .

mkdir -p ${CURRENT_PATH}/website/var/assets
touch ${CURRENT_PATH}/website/var/assets/.dummy
mkdir -p ${CURRENT_PATH}/website/var/backup
touch ${CURRENT_PATH}/website/var/backup/.dummy
mkdir -p ${CURRENT_PATH}/website/var/cache
touch ${CURRENT_PATH}/website/var/cache/.dummy
mkdir -p ${CURRENT_PATH}/website/var/classes
touch ${CURRENT_PATH}/website/var/classes/.dummy
mkdir -p ${CURRENT_PATH}/website/var/email
touch ${CURRENT_PATH}/website/var/email/.dummy
mkdir -p ${CURRENT_PATH}/website/var/log
touch ${CURRENT_PATH}/website/var/log/.dummy
mkdir -p ${CURRENT_PATH}/website/var/recyclebin
touch ${CURRENT_PATH}/website/var/recyclebin/.dummy
mkdir -p ${CURRENT_PATH}/website/var/search
touch ${CURRENT_PATH}/website/var/search/.dummy
mkdir -p ${CURRENT_PATH}/website/var/system
touch ${CURRENT_PATH}/website/var/system/.dummy
mkdir -p ${CURRENT_PATH}/website/var/tmp
touch ${CURRENT_PATH}/website/var/tmp/.dummy
mkdir -p ${CURRENT_PATH}/website/var/versions
touch ${CURRENT_PATH}/website/var/versions/.dummy
mkdir -p ${CURRENT_PATH}/website/var/webdav
touch ${CURRENT_PATH}/website/var/webdav/.dummy


echo .
echo .
echo .
echo .  .... in case of any errors;
echo .
echo .
echo .  PUT DEPLOYMENT CREDENTIALS IN THE FOLLOWING FILES:
echo .
echo .  /tools/capistrano/config/deploy.rb
echo .  /tools/capistrano/config/deploy/acceptance.rb
echo .  /tools/capistrano/config/deploy/production.rb
echo .  /tools/capistrano/config/deploy/testing.rb
echo .
echo .
echo .
echo .  DOUBLE-CHECK THE LOCAL DEV DB CREDENTIALS IN FOLLOWING FILES:
echo .
echo .  /website/var/config/system.php
echo .  /tools/build/local.cfg
echo .
echo .
echo .
echo .  AFTER YOUR FIXES, RUN THE LOCAL BUILD AGAIN:
echo .
echo .  /bin/bash ${CURRENT_PATH}/../../../tools/build/local-build.sh
echo .
echo .
echo .
echo .
echo .
echo .
echo .  ALSO:  MAKE SURE TO UPDATE THE README.md FILE
echo .
echo .
echo .


