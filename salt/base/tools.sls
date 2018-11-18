{% for tool in ['nano', 'unzip', 'tmux', 'htop', 'ncdu', 'git', 'apt-transport-https', 'molly-guard', 'python-m2crypt', 'python-pymysql'] %}
{{ tool }}:
  pkg.installed: []
{% endfor %}