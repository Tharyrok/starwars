salt-minion:
  service.running:
    - enable: True
    - listen:
      - file: /etc/salt/minion.d/signing_policies.conf

/etc/salt/minion.d/signing_policies.conf:
  file.managed:
    - source: salt://ssl/files/signing_policies.conf

/etc/pki:
  file.directory

/etc/pki/issued_certs:
  file.directory

/etc/pki/ca.key:
  x509.private_key_managed:
    - bits: 8192
    - cipher: aes_256_cbc
    - backup: True
    - require:
      - file: /etc/pki

/etc/pki/ca.crt:
  x509.certificate_managed:
    - signing_private_key: /etc/pki/ca.key
    - signing_private_key_passphrase: test
    - CN: CA Tharyrok
    - C: BE
    - ST: Bruxelles
    - L: Bruxelles
    - Email: contact@tharyrok.xyz
    - basicConstraints: "critical CA:true"
    - keyUsage: "critical cRLSign, keyCertSign"
    - subjectKeyIdentifier: hash
    - authorityKeyIdentifier: keyid,issuer:always
    - days_valid: 3650
    - days_remaining: 0
    - backup: True
    - require:
      - x509: /etc/pki/ca.key
      - file: /etc/pki

mine.send:
  module.run:
    - func: x509.get_pem_entries
    - kwargs:
        glob_path: /etc/pki/ca.crt
    - onchanges:
      - x509: /etc/pki/ca.crt