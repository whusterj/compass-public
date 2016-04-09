# Configuration for as static Compass site
link-compass-static:
  file.symlink:
    - name: /var/www/compass
    - target: /home/vagrant/compass/si360/
    - makedirs: True
    - require:
      - pkg: apache2