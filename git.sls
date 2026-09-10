include:
  - dotfiles

git:
  pkg.installed:
    - name: git

git-config-dir:
  file.directory:
    - name: /home/taben/.config/git

git-config:
  file.managed:
    - name: /home/taben/.config/git/config
    - source: /home/taben/Documents/projects/dotfiles/git/config
    - mode: '0444'
    - require:
      - git: dotfiles

git-ignore:
  file.managed:
    - name: /home/taben/.config/git/ignore
    - source: /home/taben/Documents/projects/dotfiles/git/ignore
    - mode: '0444'
    - require:
      - git: dotfiles

git-gone:
  file.managed:
    - name: /home/taben/.local/bin/git-gone
    - source: /home/taben/Documents/projects/dotfiles/git/git-gone
    - mode: '0555'
    - require:
      - git: dotfiles

git-github-configure:
  file.managed:
    - name: /home/taben/.local/bin/git-github-configure
    - source: /home/taben/Documents/projects/dotfiles/git/git-github-configure
    - mode: '0555'
    - require:
      - git: dotfiles
