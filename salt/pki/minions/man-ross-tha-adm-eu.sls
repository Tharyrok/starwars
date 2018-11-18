/etc/pki//etc/pki/man-ross-tha-adm-eu.crt
  x509.certificate_managed:
    - ca_server: man.ross.tha-adm.eu
    - signing_policy: minion
    - public_key: /etc/pki/man-ross-tha-adm-eu.key
    - CN: build.gaatech.space
    - days_remaining: 30
    - backup: True
    - managed_private_key:
        name: /etc/pki/man-ross-tha-adm-eu.key
        bits: 4096
        backup: True