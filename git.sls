git-config-dir:
  file.directory:
    - name: /home/taben/.config/git

git-config:
  file.managed:
    - name: /home/taben/.config/git/config
    - source: /home/taben/Documents/projects/dotfiles/.gitconfig
    - mode: '0444'
    - require:
      - git: dotfiles
