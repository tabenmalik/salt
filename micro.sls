micro-package:
  pkg.installed:
    - name: micro

micro-config-dir:
  file.directory:
    - name: /home/taben/.config/micro/

micro-settings:
  file.managed:
    - name: /home/taben/.config/micro/settings.json
    - source: /home/taben/Documents/projects/dotfiles/micro/settings.json
    - mode: '0444'
    - require:
      - git: dotfiles
      - file: micro-config-dir
