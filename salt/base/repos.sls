/etc/apt/sources.list:
  file.managed:
    - source: salt://base/files/repos/source-{{ grains["oscodename"]|lower }}.list
    - user: root
    - group: root
    - mode: 644

salt-repos:
  pkgrepo.managed:
    - humanname: saltstack
    - name: deb http://repo.saltstack.com/apt/debian/{{ grains['osmajorrelease'] }}/amd64/latest {{ grains['oscodename']|lower }} main
    - dist: {{ grains['oscodename']|lower }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/debian/{{ grains['osmajorrelease'] }}/amd64/latest/SALTSTACK-GPG-KEY.pub
    - refresh_db: true

elasticsearch-repos:
  pkgrepo.managed:
    - humanname: elasticsearch
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - refresh_db: true
