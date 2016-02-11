vagrant:
  user.present:
    - groups:
      - www-data
      - vagrant
    - require:
      - pkg: apache2
