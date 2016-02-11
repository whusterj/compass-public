copy-php-ini:
  file.managed:
    - name: /etc/php5/apache2/php.ini
    - source: salt://config/php.ini
    - user: root
    - group: root
    - require:
      - pkg: php5-common
      - pkg: php5-dev
