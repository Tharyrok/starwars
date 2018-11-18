repos-nginx:
  pkgrepo.managed:
    - humanname: nginx
    - name: deb http://nginx.org/packages/debian/ {{grains['oscodename']}} nginx
    - file: /etc/apt/sources.list.d/nginx.list
    - key_url: https://nginx.org/keys/nginx_signing.key
    - refresh_db: true