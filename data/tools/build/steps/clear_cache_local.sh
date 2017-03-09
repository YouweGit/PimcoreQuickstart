#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

headline "Clear Pimcore cache and restart Redis on local host"

cd ${PROJECT_DIR}

execute chmod a+x ./pimcore/cli/console.php
execute php ./pimcore/cli/console.php cache:clear

if [ 1 -eq $(which redis-cli | wc -l) ]
then
    execute redis-cli -n 4 flushdb
fi

cd ${BUILD_DIR}

exit 0
