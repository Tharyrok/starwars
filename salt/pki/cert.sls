/usr/local/share/ca-certificates:
  file.directory

/usr/local/share/ca-certificates/intca.crt:
  x509.pem_managed:
    - text: {{ salt['mine.get']('man.ross.tha-adm.eu', 'x509.get_pem_entries')['man.ross.tha-adm.eu']['/etc/pki/ca.crt']|replace('\n', '') }}
