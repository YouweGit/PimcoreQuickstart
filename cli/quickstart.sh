#!/bin/sh
CURRENT_PATH=$(cd $(dirname "$0"); pwd)
php ${CURRENT_PATH}/cli.php -a copy-plugin-files-to-project $*

git clone --depth=1 --branch=master ssh://git@source.youwe.nl:7999/pimb2b/pimcore-capistrano.git ${CURRENT_PATH}/../../../tools/capistrano
rm -rf ${CURRENT_PATH}/../../../tools/capistrano/.git

composer require youwe/pimcore-deployment
composer require youwe/pimcore-fixtures
composer require youwe/pimcore-href-typeahead
composer require youwe/pimcore-object-bridge

composer require youwe/pimcore-object-defaults
composer require youwe/pimcore-quickstart
composer require youwe/pimcore-shop

composer update

echo .
echo .
echo .
echo PLEASE PUT THE CORRECT IP ADDRESSES AND USERNAMES FOR DEPLOYMENTS IN THE FOLLOWING FILES:
echo .
echo /tools/capistrano/config/deploy.rb
echo /tools/capistrano/config/deploy/acceptance.rb
echo /tools/capistrano/config/deploy/production.rb
echo /tools/capistrano/config/deploy/testing.rb
echo .
echo .
echo .
echo PLEASE PUT THE LOCAL DEV DB CREDENTIALS IN FOLLOWING FILES:
echo .
echo /website/var/config/system.php
echo /tools/build/local.cfg
echo .
echo .
echo .