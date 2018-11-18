acmebot_repos:
  git.latest:
    - name: https://github.com/plinss/acmebot
    - target: /opt/acmebot
    - branch: master
    - force_checkout: true

virtualenv:
  pkg.installed: []

python3-dev:
  pkg.installed: []
  
/opt/acmebot/.env:
  virtualenv.managed:
    - system_site_packages: False
    - python: python3
    - requirements: /opt/acmebot/requirements.txt
    - env_vars:
        PATH_VAR: '/usr/local/bin/'

/etc/acmebot.json:
  file.managed:
    - source: salt://apps/acmebot/files/{{ grains['id'].replace('.', '-') }}.json
    - user: root
    - group: root

/opt/acmebot/.env/bin/python /opt/acmebot/acmebot -c /etc/acmebot.json -q:
  cron.present:
    - user: root
    - special: '@daily'