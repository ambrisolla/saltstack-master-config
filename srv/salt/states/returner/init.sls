install_packages:
  pip.installed:
    - name: PyMySQL
  pkg.installed:
    - name: mariadb-server
config_service:
  service.running:
    - name: mariadb
    - enable: true
copy_db_script:
  file.managed:
    - source: salt:///states/returner/configure_db.sh
    - name: /tmp/configure_db.sh
copy_db_schema:
  file.managed:
    - source: salt:///states/returner/schema.sql
    - name: /tmp/configure_db.sh