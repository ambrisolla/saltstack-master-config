{% set default_packages = salt['pillar.get']('default_packages') %}
install_default_packages:
    pkg.installed:
        - pkgs: {{ default_packages }}