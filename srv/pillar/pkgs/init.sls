default_packages:
  - vim-enhanced
  - net-tools
  - zip
  - unzip
  - curl
  - wget
# Master config
{% if grains['id'] == 'master' %}  
  - jq
  - python3-pip
{% endif %}