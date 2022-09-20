#!/bin/bash
#
# Author  : Andre Brisolla
# Date    : Sep 20, 2022
# Version : 0.1
# Goal    : Syncronize Salt configuration files
#

WORKSPACE_DIR=$1

sync_etc() {
  echo "= $1 ="
}

sync_etc ${WORKSPACE_DIR}