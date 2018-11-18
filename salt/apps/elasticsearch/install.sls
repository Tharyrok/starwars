elasticsearch:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: elasticsearch
      - pkg: zulu-8
