{% set ntp_servers = salt['pillar.get']('ntp_servers') %}

config_ntp:
  pkg.installed:
    - name: chrony
  file.managed:
    - source: salt://files/ntp/chrony.conf
    - name: /etc/chrony.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
        ntp_servers: {{ ntp_servers }}
  service.running:
    - name: chronyd
    - enable: True
    - restart: True
    - watch:
      - file: /etc/chrony.conf
    