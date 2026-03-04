/etc/salt/minion.d/minion.conf:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://minion.conf
