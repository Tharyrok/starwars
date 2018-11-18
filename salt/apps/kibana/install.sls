kibana:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: kibana
      - pkg: zulu-8
