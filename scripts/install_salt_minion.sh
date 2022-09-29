#!/bin/bash
curl -fsSL https://bootstrap.saltproject.io  | bash && \
  echo "#startup_states: 'highstate'" >>/etc/salt/minion.d/startup_states.conf && \
  echo "master: 192.168.0.200" >>/etc/salt/minion.d/master.conf && \
  systemctl enable salt-minion && systemctl start salt-minion
