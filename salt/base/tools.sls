{% for tool in ['nano', 'unzip', 'tmux', 'htop', 'ncdu', 'git', 'apt-transport-https', 'molly-guard', 'python-m2crypto', 'python-pymysql', 'tree'] %}
{{ tool }}:
  pkg.installed: []
{% endfor %}