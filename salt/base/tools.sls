{% for tool in [
    'nano',
    'unzip',
    'tmux',
    'htop',
    'ncdu',
    'git',
    'apt-transport-https',
    'molly-guard',
    'python-m2crypto',
    'python-pymysql',
    'tree',
    'qemu-guest-agent'
  ] %}
{{ tool }}:
  pkg.installed: []
{% endfor %}