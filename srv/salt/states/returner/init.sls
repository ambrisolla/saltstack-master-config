configure_database:
  pip.installed:
    - name: PyMySQL
  pkg.installed:
    - name: mariadb-server
  file.managed:
    - source: salt:///states/returner/configure_db.sh
    - name: /tmp/configure_db.sh

