/etc/salt/minion.d/minion.conf:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        file_client: local
