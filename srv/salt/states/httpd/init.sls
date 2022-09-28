install_httpd:
  pkg.installed:
    - name: httpd
enable_httpd:
  service.running:
    - name: httpd
    - enable: True  