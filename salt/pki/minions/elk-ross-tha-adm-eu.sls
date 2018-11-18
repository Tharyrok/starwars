/etc/pki/elk-tha-adm-eu.crt:
  x509.certificate_managed:
    - ca_server: man.ross.tha-adm.eu
    - signing_policy: minion
    - public_key: /etc/pki/elk-tha-adm-eu.key
    - CN: elk.tha-adm.eu
    - days_remaining: 30
    - backup: True
    - managed_private_key:
        name: /etc/pki/elk-tha-adm-eu.key
        bits: 4096
        backup: True