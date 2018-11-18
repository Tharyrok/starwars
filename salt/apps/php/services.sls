reload-php5.6-fpm:
  service.running:
    - name: php5.6-fpm
    - enable: True
    - reload: True
    - watch:
      - file: /etc/php/5.6/mods-available/*.ini
      - file: /etc/php/5.6/fpm/php.ini

reload-php7.2-fpm:
  service.running:
    - name: php7.2-fpm
    - enable: True
    - reload: True
    - watch:
      - file: /etc/php/7.2/mods-available/*.ini
      - file: /etc/php/7.2/fpm/php.ini
