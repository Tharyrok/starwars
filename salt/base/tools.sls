{% for tool in ['nano', 'unzip', 'tmux', 'htop', 'ncdu', 'git', 'apt-transport-https', 'molly-guard'] %}
{{ tool }}:
  pkg.installed: []
{% endfor %}