install-composer:
  cmd.run:
    - name: "curl -sS https://getcomposer.org/installer | php"
    - shell: /bin/bash
    - cwd: /home/vagrant/compass
    - user: vagrant
    - group: vagrant
    - require:
      - pkg: php5-common
      - pkg: php5-dev


add-mailgun:
  cmd.run:
    - name: "php composer.phar require mailgun/mailgun-php:~1.7.1"
    - shell: /bin/bash
    - cwd: /home/vagrant/compass
    - user: vagrant
    - group: vagrant
    - require:
      - pkg: php5-common
      - pkg: php5-dev
      - cmd: install-composer
