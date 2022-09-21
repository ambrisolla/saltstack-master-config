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
  has_diff=0
  for file in `find ${WORKSPACE_DIR}/s/etc -type f `; 
  do 
    dest_file=$(echo ${file} | sed -re "s|$WORKSPACE_DIR/s||g"  )
    if ! diff $file $dest_file
    then
      if sudo rsync -a $file $dest_file
      then
        echo "Syncing \"${dest_file}\"... ok"
      else
        echo "Syncing \"${dest_file}\"... fail"
      fi  
      has_diff=1
    fi
  done
  if [ $has_diff -eq 1 ]
  then
    if sudo systemctl restart salt-master
    then
      echo "Restarting Salt Master... ok"
    else
      echo "Restarting Salt Master... fail"
      exit 1
    fi
  fi
}


sync_etc_2() {
  _rsync=$(rsync -aEim ${WORKSPACE_DIR}/s/etc/salt/* /etc/salt/)
  if [ -n $_rsync ]
  then
    echo "Direcotory \"/etc/salt\" has changed. Restarting Salt Master..."
    systemctl restart salt-master
    if [ $? -eq 0 ]
    then
      echo "Salt Master Restarted!"
    else
      echo "Error Restarting Salt Master!"
      exit 1
    fi
  else
    echo "Nothing changed in \"/etc/salt\""
  fi 
}

#sync_etc
sync_etc_2