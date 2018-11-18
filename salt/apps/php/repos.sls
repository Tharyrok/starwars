sury-repos:
  pkgrepo.managed:
    - humanname: sury
    - name: deb https://packages.sury.org/php/ {{ grains["oscodename"]|lower }} main
    - file: /etc/apt/sources.list.d/sury.list
    - key_url: https://packages.sury.org/php/apt.gpg
    - refresh_db: true
