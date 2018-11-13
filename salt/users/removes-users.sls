{% for user in pillar['remove_users'] %}
{{ user }}:
  user.absent
{% endfor %}
