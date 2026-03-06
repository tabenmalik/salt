# based on instructions from https://support.mozilla.org/en-US/kb/install-firefox-linux
firefox:
  file.managed:
    - name: /etc/apt/preferences.d/mozilla
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - contents: |
        Package: *
        Pin: origin packages.mozilla.org
        Pin-Priority: 1000
  pkgrepo.managed:
    - humanname: Mozilla Firefox
    - name: deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main
    - file: /etc/apt/sources.list.d/mozilla.list
    - key_url: https://packages.mozilla.org/apt/repo-signing-key.gpg
    - aptkey: False
    - refresh: True
  pkg.installed:
    - name: firefox
