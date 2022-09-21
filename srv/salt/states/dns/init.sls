{% set nameservers = salt['pillar.get']('dns_resolver:nameservers') %}
{% set search = salt['pillar.get']('dns_resolver:search') %}
{% set options = salt['pillar.get']('dns_resolver:options') %}


dns_resolver:
  file.managed:
    - source: salt://files/dns/resolv.conf
    - name: /etc/resolv.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
        nameservers: {{ nameservers }}
        search: {{ search }}
        options: {{ options }}

