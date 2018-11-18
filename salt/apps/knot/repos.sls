repos-knot:
  pkgrepo.managed:
    - humanname: knot
    - name: deb https://deb.knot-dns.cz/knot-latest/ stretch main
    - file: /etc/apt/sources.list.d/knot.list
    - key_url: /etc/apt/trusted.gpg.d/knot-latest.gpg
    - refresh_db: true