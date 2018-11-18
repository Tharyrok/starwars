ssmtp.packages:
  pkg.installed:
    - pkgs:
      - ssmtp


/etc/ssmtp/ssmtp.conf:
  file.managed:
    - source:
      - salt://apps/ssmtp/files/ssmtp.conf
    - user: root
    - group: root
    - mode: 644