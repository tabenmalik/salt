python:
  pkg.installed:
    - pkgs:
      - python3
      - python3-virtualenv

{% set tools = ["astpretty", "pre-commit", "tox", "flake8", "uninstall-dot", "build", "twine"]%}
python-tools:
  virtualenv.managed:
    - name: /home/taben/.local/state/venv-python-tools
    - pip_pkgs: {{ tools }}

{% for tool in tools %}
/home/taben/.local/bin/{{ tool }}:
  file.symlink:
    - target: /home/taben/.local/state/venv-python-tools/bin/{{ tool }}
    - user: taben
    - group: taben
    - mode: '0755'
{% endfor %}
