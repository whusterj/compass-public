/etc/apache2/ports.conf:
  file.managed:
    - user: vagrant
    - group: vagrant
    - source: salt://config/apache/ports.conf


apache-clear-default-site:
  file.absent:
    - name: /etc/apache2/sites-enabled/000-default.conf


link-compass-public-config:
  file.managed:
    - name: /etc/apache2/sites-available/compass-public.conf
    - source: salt://config/apache/compass-public.conf
    - user: vagrant
    - group: vagrant
    - require:
      - pkg: apache2


enable-compass-public-config:
  file.symlink:
    - name: /etc/apache2/sites-enabled/compass-public.conf
    - target: /etc/apache2/sites-available/compass-public.conf
    - require:
      - pkg: apache2


enable-mod-rewrite:
  cmd.run:
    - name: "a2enmod rewrite"
    - require:
      - pkg: apache2


run-apache2-service:
  service.running:
    - name: apache2
    - enable: True
    - reload: True
    - watch:
      - file: enable-compass-public-config
      - cmd: enable-mod-rewrite
