install_node:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/compass/bin/activate && nodeenv --node=0.11.16 --prebuilt -p"
    - cwd: /home/vagrant/compass/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/compass
      - pkg: curl

setup_grunt:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/compass/bin/activate && npm config set unicode=false && npm install -g grunt-cli && npm install --no-bin-links"
    - cwd: /home/vagrant/compass/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/compass
