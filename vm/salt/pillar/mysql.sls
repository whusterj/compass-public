mysql:
  server:
    root_password: ''
    bind-address: 127.0.0.1
    port: 3306
    user: mysql

  # Manage databases
  database:
    - wp_compass_public

  # Manage users
  user:
    - name: compass
      password: 'I24Ahwmbdcpqe8YM6GlE'
      host: localhost
      databases:
        - database: wp_compass_public
          grants: ['all privileges']

  # Override any names defined in map.jinja
  lookup:
    server: mysql-server
    client: mysql-client
    service: mysql
    config: /etc/mysql/my.cnf
    python: python-mysqldb
