#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

headline "Importing database ..."

execute cd ${BUILD_DIR}/dumps

execute mysql -h${DBHost} -u${DBUser} -p${DBPassword} --port=${DBPort} ${DBName} < ${BUILD_DIR}/dumps/kill_tables.sql

execute mysql -h${DBHost} -u${DBUser} -p${DBPassword} --port=${DBPort} ${DBName} < ${BUILD_DIR}/dumps/db_structure.sql
execute mysql -h${DBHost} -u${DBUser} -p${DBPassword} --port=${DBPort} ${DBName} < ${BUILD_DIR}/dumps/post_install.sql

execute cd ${BUILD_DIR}

exit 0
