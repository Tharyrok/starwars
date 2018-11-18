repos-mysql:
  pkgrepo.managed:
    - humanname: percona-mysql
    - name: deb http://repo.percona.com/apt stretch main
    - file: /etc/apt/sources.list.d/mysql.list
    - keyid: 1C4CBDCDCD2EFD2A
    - keyserver: keyserver.ubuntu.com
    - refresh_db: true