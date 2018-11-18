repos-postgresql:
  pkgrepo.managed:
    - humanname: postgresql
    - name: deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main
    - file: /etc/apt/sources.list.d/postgresql.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - refresh_db: true