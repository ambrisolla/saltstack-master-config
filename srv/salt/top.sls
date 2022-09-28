base:
  '*':
    - states.schedules
    - states.dns
    - states.ntp
    - states.pkgs
  'master':
    - states.returner
  'minion-01':
    - states.httpd