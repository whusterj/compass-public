/var/www/wordpress:
  file.symlink:
    - target: /home/vagrant/wordpress


download-wordpress:
  cmd.run: 
    - user: vagrant
    - name: "sudo wget http://wordpress.org/latest.tar.gz"
    - cwd: /tmp


unzip-wordpress:
  cmd.run: 
    - user: vagrant 
    - name: "sudo tar -xzvf latest.tar.gz -C /home/vagrant/"
    - cwd: /tmp
    - require:
      - cmd: download-wordpress


link-compass-theme:
  file.symlink:
    - name: /home/vagrant/wordpress/wp-content/themes/compass-theme
    - target: /home/vagrant/compass/compass-theme
    - user: vagrant
    - group: www-data
    - mode: 775


set-wordpress-permissions:
  file.directory:
    - name: /home/vagrant/wordpress
    - user: vagrant
    - group: www-data
    - file_mode: 664
    - dir_mode: 775
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: apache2
      - file: link-compass-theme


set-wp-content-permissions:
  file.directory:
    - name: /home/vagrant/wordpress/wp-content
    - user: vagrant
    - group: www-data
    - file_mode: 775
    - dir_mode: 775
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: apache2
      - file: set-wordpress-permissions


copy-wp-config:
  file.managed:
    - name: /home/vagrant/wordpress/wp-config.php
    - source: salt://config/wordpress/wp-config.php
    - user: vagrant
    - group: www-data
    - mode: 440
    - require:
      - file: set-wp-content-permissions
