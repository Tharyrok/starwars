ssh:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - user: root
    - group: root
    - mode: 0440
    - source: salt://base/files/openssh/sshd_config