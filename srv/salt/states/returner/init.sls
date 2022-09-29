{% set master_job_cache = salt['pillar.get']('master_job_cache') %}
{% set mysql_host = salt['pillar.get']('mysql.host') %}
{% set mysql_user = salt['pillar.get']('mysql.user') %}
{% set mysql_db = salt['pillar.get']('mysql.db') %}
{% set mysql_port = salt['pillar.get']('mysql.port') %}
{% set mysql_pass = salt['pillar.get']('mysql.pass') %}
install_packages:
  pip.installed:
    - name: PyMySQL
create_master_returner_config_file:
  file.managed:
    - source: salt://files/returner/returner.conf
    - name: /etc/salt/master.d/returner.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
        master_job_cache: {{ master_job_cache }}
        mysql_host: {{ mysql_host }}
        mysql_user: {{ mysql_user }}
        mysql_db: {{ mysql_db }}
        mysql_port: {{ mysql_port }}
        mysql_pass: {{ mysql_pass }}
restart_salt_master_if_returner_config_file_changes:
  service.running:
    - name: salt-master
    - full_restart: true
    - enable: true
    - watch:
      - file: /etc/salt/master.d/returner.conf  

  
