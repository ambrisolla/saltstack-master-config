#!/bin/bash
#
# Author  : Andre Brisolla
# Date    : Sep 20, 2022
# Version : 0.1
# Goal    : Syncronize Salt configuration files
#

WORKSPACE_DIR=$1
SALT_CONFIG_DIR="/etc/salt"
SALT_FILES_DIR="/srv"
LOG_FILE="${WORKSPACE_DIR}/s/scripts/yncronize.log"

sync_etc() {
  echo -ne "\n\nStarting copy at: $(date)" >> ${LOG_FILE}
  if rsync -av ${WORKSPACE_DIR}/s/etc/salt/* /etc/salt/ 2>> ${LOG_FILE} >> ${LOG_FILE}
  then
    echo -ne " - copying /etc/salt files... ok"
  else
    echo -ne " - copying /etc/salt files... fail"
    cat ${LOG_FILE}
    exit 1
  fi
}

sync_etc