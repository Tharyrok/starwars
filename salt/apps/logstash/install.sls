logstash:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: logstash
      - pkg: zulu-8
