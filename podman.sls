podman:
  pkg.installed:
    - name: podman
  file.symlink:
    - name: /home/taben/.local/bin/docker
    - target: /usr/bin/podman
    - user: taben
    - group: taben
    - mode: '0755'
