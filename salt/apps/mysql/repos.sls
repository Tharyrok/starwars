repos-mysql:
  pkgrepo.managed:
    - humanname: percona-mysql
    - name: deb http://repo.percona.com/apt stretch main
    - file: /etc/apt/sources.list.d/mysql.list
    - keyid: 9334A25F8507EFA5
    - keyserver: keyserver.ubuntu.com
    - refresh_db: true