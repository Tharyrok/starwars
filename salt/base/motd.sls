{% if grains['os'] == "Debian" %}
{% if grains["osmajorrelease"] <= 9 %}

/etc/update-motd.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/etc/update-motd.d/10-tharyrok:
  file.managed:
    - source:
      - salt://base/files/10-tharyrok
    - user: root
    - group: root
    - mode: 755

/etc/update-motd.d/10-uname:
  file.absent: []

/etc/motd:
  file.managed:
    - source:
      - salt://base/files/motd
    - user: root
    - group: root
    - mode: 644
{% endif %}
{% endif %}
