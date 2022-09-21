dns_resolver:
  nameservers:
    - 8.8.8.8
    - 8.8.4.4
    - 1.1.1.1
  search: brisa.local
  options:
    - rotate
    - timeout:1
    - attempts:5