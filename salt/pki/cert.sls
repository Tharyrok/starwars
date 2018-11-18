/usr/local/share/ca-certificates:
  file.directory

/usr/local/share/ca-certificates/intca.crt:
  x509.pem_managed:
    - text: {{ salt['mine.get']('man.ross.tha-adm.eu', 'x509.get_pem_entries')['man.ross.tha-adm.eu']['/etc/pki/ca.crt']|replace('\n', '') }}
  cmd.run:
    - name: update-ca-certificates
    - runas: root


/usr/local/share/ca-certificates/elasticsearch-ca.crt:
  file.managed:
    - user: root
    - group: root
    - mode: 0444
    - source: salt://pki/files/elasticsearch-ca.crt
  cmd.run:
    - name: update-ca-certificates
    - runas: root

/etc/pki:
  file.directory

/etc/pki/issued_certs:
  file.directory

/etc/pki/{{ grains['id'].replace('.', '-') }}.crt:
  x509.certificate_managed:
    - ca_server: man.ross.tha-adm.eu
    - signing_policy: minion
    - public_key: /etc/pki/{{ grains['id'].replace('.', '-') }}.key
    - CN: {{ grains['id'] }}
    - days_remaining: 30
    - backup: True
    - managed_private_key:
        name: /etc/pki/{{ grains['id'].replace('.', '-') }}.key
        bits: 4096
        backup: True
