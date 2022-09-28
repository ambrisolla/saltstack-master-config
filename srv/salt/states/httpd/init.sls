install_httpd:
  pkg.installed:
    - pkgs: 
        - httpd
        - telnet
enable_httpd:
  service.running:
    - name: httpd
    - enable: True  