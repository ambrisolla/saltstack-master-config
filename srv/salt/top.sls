base:
  '*':
    - states.schedules
    - states.dns
    - states.ntp
    - states.pkgs
  'minion-01':
    - states.httpd