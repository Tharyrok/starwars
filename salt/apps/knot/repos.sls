repos-knot:
  pkgrepo.managed:
    - humanname: knot
    - name: deb https://deb.knot-dns.cz/knot-latest/ stretch main
    - file: /etc/apt/sources.list.d/knot.list
    - keyid: AC0E47584A7A714D
    - keyserver: keyserver.ubuntu.com
    - refresh_db: true