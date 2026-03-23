python:
  pkg.installed:
    - pkgs:
      - python3
      - python3-virtualenv

{% set tools = ["astpretty", "build", "flake8", "gprof2dot", "pre-commit", "tox", "twine", "uninstall-dot"]%}
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
