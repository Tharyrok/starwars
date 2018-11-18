{% if pillar['nginx'] %}

{% if pillar['nginx']['redirect-ssl'] %}
{% for virtual in pillar['nginx']['redirect-ssl'] %}

/etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}:
  file.managed:
    - name: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
    - source:
      - salt://apps/nginx/templates/redirect-ssl.jinja
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - defaults:
        virtual: {{ virtual }}

/etc/nginx/sites-enabled/{{ virtual['source'].replace('.', '-') }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
    - require:
      - file: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
{% endfor %}
{% endif %}

{% if pillar['nginx']['proxy-ssl'] %}
{% for virtual in pillar['nginx']['proxy-ssl'] %}

/etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}:
  file.managed:
    - name: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
    - source:
      - salt://apps/nginx/templates/proxy-ssl.jinja
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - defaults:
        virtual: {{ virtual }}

/etc/nginx/sites-enabled/{{ virtual['source'].replace('.', '-') }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
    - require:
      - file: /etc/nginx/sites-available/{{ virtual['source'].replace('.', '-') }}
{% endfor %}
{% endif %}

{% endif %}
