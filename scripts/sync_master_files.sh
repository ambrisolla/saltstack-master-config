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
LOG_FILE="${WORKSPACE_DIR}/s/scripts/syncronize.log"

sync_etc() {
  _rsync=$(sudo rsync -aEim --delete ${WORKSPACE_DIR}/s/etc/salt/* /etc/salt/)
  if [ -n "$_rsync" ]
  then
    echo "Direcotory \"/etc/salt\" has changed. Restarting Salt Master..."
    sudo systemctl restart salt-master
    if [ $? -eq 0 ]
    then
      echo "Salt Master Restarted!"
    else
      echo "Error Restarting Salt Master!"
      exit 1
    fi
  else
    echo "Nothing changed in \"/etc/salt\"!"
  fi 
}

sync_srv() {
  _rsync=$(sudo rsync -aEim --delete ${WORKSPACE_DIR}/s/srv/{salt,pillar} /srv)
  if [ -n "$_rsync" ]
  then
    echo "Direcotories \"/srv/salt\" and \"/srv/pillar\" has changed!"
  else
    echo "Nothing changed in \"/srv/salt\" and \"/srv/pillar\"!"
  fi
}

sync_etc
sync_srv