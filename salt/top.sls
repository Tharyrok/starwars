base:
  '*':
    - .base
    - .users.users-admin
    - .pki.cert
    {% if grains['id'] is not 'mail.ross.tha-adm.eu' %}
    - .apps.ssmtp
    {% endif %}

  'man.ross.tha-adm.eu':
    - .pki.ca
  
  'web.ross.tha-adm.eu':
    - .apps.php
    - .apps.nginx
    - .apps.acmebot

  'sql.ross.tha-adm.eu':
    - .apps.mysql
    - .apps.postgresql

  'elk.ross.tha-adm.eu':
    - .apps.java
    - .apps.elasticsearch
    - .apps.kibana
    - .apps.logstash

  'dns.ross.tha-adm.eu':
    - .apps.knot

  'mail.ross.tha-adm.eu':
    - .apps.nginx
    - .apps.acmebot
