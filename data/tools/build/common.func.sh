#!/usr/bin/env bash

# directory of this bash script
[ -z "$BUILD_DIR" ] && BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[ -z "$PROJECT_DIR" ] && PROJECT_DIR=$BUILD_DIR/../..

# include local config file in case it exists
if [ -f $BUILD_DIR/local.cfg ]
then
    source $BUILD_DIR/local.cfg
fi

function buildFailedSimple
{
    ecode=$?;
    if [ 0 -ne $ecode ]
        then
            echo Received exit code $ecode
            echo $1
            exit 1
    fi
}

function start() {
  yyyy_mm_dd_hh_mi_ss=$(date +"%Y-%m-%d %H:%M:%S")
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++                             start                           +++"
  echo "+++                      $yyyy_mm_dd_hh_mi_ss                    +++"
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}

function message() {
  echo "+++ $@"
}

function headline() {
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++ $@ "
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}

function execute() {
  message "$@"
  eval "$@"
  check_successful $?
}

function finished() {
  yyyy_mm_dd_hh_mi_ss=$(date +"%Y-%m-%d %H:%M:%S")
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++                      $yyyy_mm_dd_hh_mi_ss                    +++"
  echo "+++                          finished                           +++"
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  exit 0
}

function failed() {
  yyyy_mm_dd_hh_mi_ss=$(date +"%Y-%m-%d %H:%M:%S")
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++                      $yyyy_mm_dd_hh_mi_ss                    +++"
  echo "+++                           failed                            +++"
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  exit $1
}

function check_successful() {
  rc=$1
  if [ $rc -ne 0 ]
  then
    failed $rc
  fi
}