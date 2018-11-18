{% for php in [
  'php5.6-fpm', 
  'php5.6-bcmath', 
  'php5.6-bz2', 
  'php5.6-cli', 
  'php5.6-curl', 
  'php5.6-gd', 
  'php5.6-intl', 
  'php5.6-json', 
  'php5.6-mbstring', 
  'php5.6-mcrypt', 
  'php5.6-opcache', 
  'php5.6-soap', 
  'php5.6-tidy', 
  'php5.6-xml', 
  'php5.6-zip', 
  'php-memcache', 
  'php5.6-mysql'
] %}
{{ php }}:
  pkg.installed: []
{% endfor %}

