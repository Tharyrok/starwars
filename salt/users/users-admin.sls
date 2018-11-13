{% for name, user in pillar.get('users-admin', {}).items() %}
{{ name }}:
   user.present:
    - shell: {{ user['shell'] }}
    - groups:
      - sudo
    - password: {{ user['password'] }}

{{ name }}_key:
  ssh_auth.present:
    - user: {{ name }}
    - names:
{% for ssh in user['keys'] %}
      - {{ ssh }}
{% endfor %}
{% endfor %}