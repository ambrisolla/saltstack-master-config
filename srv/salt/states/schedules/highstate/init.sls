{% set function = salt['pillar.get']('schedule:highstate:function') %}
{% set seconds = salt['pillar.get']('schedule:highstate:seconds') %}
highstate:
  schedule.present:
    - function: {{ function }}
    - seconds: {{ seconds }}
