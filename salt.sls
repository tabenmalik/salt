# public key from:
# curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | gpg --dearmor > ./salt-archive-keyring.pgp
salt:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - names:
      - /etc/apt/keyrings/salt-archive-keyring.pgp:
        - makedirs: True
        - source: files/salt-archive-keyring.pgp
      - /etc/apt/sources.list.d/salt.sources:
        - makedirs: True
        - source: files/salt.sources
      - /etc/apt/preferences.d/salt-pin-1001:
        - contents: |
            Package: salt-*
            Pin: version 3006.*
            Pin-Priority: 1001
  pkg.installed:
    - name: salt-common

salt-config:
  file.managed:
    - name: /etc/salt/minion.d/minion.conf
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - contents: |
        file_client: local
