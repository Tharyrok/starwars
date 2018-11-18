{% for dir in ['/var/www', '/var/www/default', '/var/www/acmebot', '/var/www/error', '/etc/nginx/sites-enabled', '/etc/nginx/sites-available', '/etc/nginx/ssl/'] %}
{{ dir }}:
  file.directory:
    - user: root
    - group: root
    - file_mode: 744
    - dir_mode: 755
    - makedirs: True

{% endfor %}

/var/www/default/index.html:
  file.touch

/var/www/default/maintenance.html:
  file.managed:
    - source:
      - salt://apps/nginx/files/maintenance.html
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/nginx.conf:
  file.managed:
    - source:
      - salt://apps/nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/sites-available/default:
  file.managed:
    - source:
      - salt://apps/nginx/files/default
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/ssl/nginx.crt:
  file.managed:
    - source:
      - salt://apps/nginx/files/ssl/nginx.crt
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/ssl/nginx.key:
  file.managed:
    - source:
      - salt://apps/nginx/files/ssl/nginx.key
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/ssl/dhparam.pem:
  file.managed:
    - source:
      - salt://apps/nginx/files/ssl/dhparam.pem
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/conf.d/default.conf:
  file.absent

/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default

/var/www/error/error-404.html:
  file.managed:
    - source:
      - salt://apps/nginx/files/error/404.html
    - user: root
    - group: root
    - mode: '0644'

/var/www/error/error-50x.html:
  file.managed:
    - source:
      - salt://apps/nginx/files/error/50x.html
    - user: root
    - group: root
    - mode: '0644'