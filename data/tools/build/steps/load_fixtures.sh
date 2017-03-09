#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

headline "Reinstalling pimcore db ..."

execute cd ${PROJECT_DIR}

execute time php ${PROJECT_DIR}/pimcore/cli/console.php fixtures:load

execute cd ${BUILD_DIR}

exit 0
