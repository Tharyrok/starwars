nginx-config-test:
  module.wait:
    - name: nginx.configtest
    - watch:
      - file: /etc/nginx/sites-available/*
      - file: /etc/nginx/sites-enabled/*
      - file: /etc/nginx/conf.d/*.conf
      - file: /etc/nginx/nginx.conf

reload-nginx:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - module: nginx-config-test