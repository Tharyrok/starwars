us_locale:
  locale.present:
    - name: en_US.UTF-8

be_locale:
  locale.present:
    - name: fr_BE.UTF-8

fr_locale:
  locale.present:
    - name: fr_FR.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: be_locale
      - locale: fr_locale
      - locale: us_locale

UTC:
  timezone.system:
    - utc: True

/etc/systemd/timesyncd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://base/files/timesyncd.j2
    - template: jinja

reload-timesyncd:
  service.running:
    - name: systemd-timesyncd
    - enable: True
    - reload: True
    - watch:
      - file: /etc/systemd/timesyncd.conf