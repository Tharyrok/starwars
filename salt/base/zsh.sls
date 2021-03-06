zsh:
  pkg.installed

python-pygments:
  pkg.installed

{% if grains['os'] == "Debian" %}
safe-rm:
  pkg.installed
{% endif %}

{% if grains['os'] == "Debian" %}
{% for file in ['zlogin', 'zlogout', 'zprofile', 'zshenv', 'zshfct'] %}

/etc/zsh/{{ file }}:
  file.managed:
    - source: salt://base/files/zsh/{{ file }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: zsh

{% endfor %}

/etc/zsh/zshrc:
  file.managed:
    - source: salt://base/files/zsh/zshrc.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: zsh

{% elif grains['os'] == "CentOS" %}
{% for file in ['zlogin', 'zlogout', 'zprofile', 'zshenv', 'zshfct'] %}

/etc/{{ file }}:
  file.managed:
    - source: salt://base/files/zsh/{{ file }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: zsh

{% endfor %}

/etc/zshrc:
  file.managed:
    - source: salt://base/files/zsh/zshrc.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: zsh
{% endif %}

/home/tharyrok/.zshrc:
  file.managed:
    - source: salt://base/files/zsh/zshrc-tharyrok
    - user: tharyrok
    - group: tharyrok
    - mode: 644
    - require:
      - pkg: zsh