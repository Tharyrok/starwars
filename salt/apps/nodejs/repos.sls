repos-noejs:
  pkgrepo.managed:
    - humanname: nodejs
    - name: deb https://deb.nodesource.com/node_8.x stretch main
    - file: /etc/apt/sources.list.d/node.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - refresh_db: true