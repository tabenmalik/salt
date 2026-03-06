# public key from:
# curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | gpg --dearmor > ./salt-archive-keyring.pgp
salt:
  pkgrepo.managed:
    - humanname: Salt Project
    - name: deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://packages.broadcom.com/artifactory/saltproject-deb/ stable main
    - file: /etc/apt/sources.list.d/salt.list
    - key_url: https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public
    - aptkey: False
  file.managed:
    - name: /etc/apt/preferences.d/salt-pin-1001
    - user: root
    - group: root
    - mode: '0644'
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
