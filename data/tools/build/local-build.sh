#!/usr/bin/env bash

source $(dirname $0)/common.func.sh
start
set -e

time $(dirname $0)/steps/composer.sh || exit 1
time $(dirname $0)/steps/import_db.sh || exit 2
time $(dirname $0)/steps/update_classdefinitions.sh || exit 3
time $(dirname $0)/steps/load_fixtures.sh || exit 4
time $(dirname $0)/steps/clear_cache_local.sh || exit 5

finished
