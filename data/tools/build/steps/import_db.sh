#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

headline "Importing database ..."

execute cd ${BUILD_DIR}/dumps

mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "DROP DATABASE IF EXISTS $DBName;"
mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "CREATE DATABASE $DBName CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "SET AUTOCOMMIT=0;"
mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "SET UNIQUE_CHECKS=0;"
mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "SET GLOBAL INNODB_FLUSH_LOG_AT_TRX_COMMIT=2;"
mysql -h${DBHost} -u${DBUser} -p${DBPassword} -e "SET FOREIGN_KEY_CHECKS=0;"

execute mysql -h${DBHost} -u${DBUser} -p${DBPassword} --port=${DBPort} ${DBName} < ${BUILD_DIR}/dumps/db_structure.sql
execute mysql -h${DBHost} -u${DBUser} -p${DBPassword} --port=${DBPort} ${DBName} < ${BUILD_DIR}/dumps/post_install.sql

mysql -h$DBHost -u$DBUser -p$DBPassword -e "COMMIT;"
mysql -h$DBHost -u$DBUser -p$DBPassword -e "SET FOREIGN_KEY_CHECKS=1;"
mysql -h$DBHost -u$DBUser -p$DBPassword -e "SET GLOBAL INNODB_FLUSH_LOG_AT_TRX_COMMIT=1;"
mysql -h$DBHost -u$DBUser -p$DBPassword -e "SET UNIQUE_CHECKS=1;"
mysql -h$DBHost -u$DBUser -p$DBPassword -e "COMMIT;"

execute cd ${BUILD_DIR}

exit 0

