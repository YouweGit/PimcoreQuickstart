#!/bin/sh
CURRENT_PATH=$(cd $(dirname "$0"); pwd)
php ${CURRENT_PATH}/cli.php -a copy-project-files-to-plugin $*
