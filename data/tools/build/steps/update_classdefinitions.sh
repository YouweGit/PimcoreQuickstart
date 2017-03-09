#!/usr/bin/env bash

source $(dirname $0)/../common.func.sh

headline "Migrating classes ..."

PIMCORE_DEPLOY_PATH=${PROJECT_DIR}/plugins/PimcoreDeployment
# Clear classes to avoid errors when migrating class field collection definitions see Fieldcollection/Definition::save()
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/clear-classes.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-field-collection.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-definition.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-customlayout.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-bricks.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-staticdata.sh
time /bin/sh $PIMCORE_DEPLOY_PATH/cli/import-customsql.sh


execute cd ${BUILD_DIR}

exit 0
