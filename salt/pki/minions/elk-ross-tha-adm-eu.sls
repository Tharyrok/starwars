/etc/elasticsearch/elk-tha-adm-eu.crt:
  x509.certificate_managed:
    - ca_server: man.ross.tha-adm.eu
    - signing_policy: minion
    - public_key: /etc/elasticsearch/elk-tha-adm-eu.key
    - CN: elk.tha-adm.eu
    - days_remaining: 30
    - backup: True
    - user: elasticsearch
    - group: elasticsearch
    - managed_private_key:
        name: /etc/elasticsearch/elk-tha-adm-eu.key
        bits: 2048
        backup: True
        user: elasticsearch
        group: elasticsearch

/etc/elasticsearch/ca.crt:
  x509.pem_managed:
    - text: {{ salt['mine.get']('man.ross.tha-adm.eu', 'x509.get_pem_entries')['man.ross.tha-adm.eu']['/etc/pki/ca.crt']|replace('\n', '') }}
    - user: elasticsearch
    - group: elasticsearch