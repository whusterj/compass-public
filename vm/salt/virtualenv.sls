compass-virtualenv:
  virtualenv.managed:
    - name: /home/vagrant/.virtualenvs/compass
    - system_site_packages: True
    - user: vagrant
    - require:
      - pkg: python-dev
      - pkg: python-virtualenv


add-project-to-python-path:
  cmd.run:
    - user: vagrant
    - name: "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh && source ../.virtualenvs/compass/bin/activate && add2virtualenv ."
    - cwd: /home/vagrant/compass
    - shell: /bin/bash
    - require:
      - virtualenv: compass-virtualenv
      - pkg: virtualenvwrapper
      - pkg: python-virtualenv


install-python-requirements:
  cmd.run:
    - user: vagrant
    - name: "source ../.virtualenvs/compass/bin/activate && pip install -r python-requirements.txt"
    - cwd: /home/vagrant/compass
    - shell: /bin/bash
    - require:
      - virtualenv: compass-virtualenv
      - pkg: virtualenvwrapper
      - pkg: python-virtualenv
