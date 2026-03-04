configuration management for my personal machines.

using a standalone minion setup.

update machine with `salt-call --file-root=$(pwd) state.apply`

## setup

install instructions for the LTS version.
provided by https://docs.saltproject.io/salt/install-guide/en/latest/topics/install-by-operating-system/linux-deb.html
```
# Ensure keyrings dir exists
mkdir -m 755 -p /etc/apt/keyrings
# Download public key
curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | gpg --dearmor | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp > /dev/null
# Create apt repo target configuration
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources
```

populate /etc/apt/preferences.d/salt-pin-1001 in order to restrict upgrades to Salt 3006 LTS:
```
echo 'Package: salt-*
Pin: version 3006.*
Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/salt-pin-1001
```

install the salt-minion
```
sudo apt-get update
sudo apt-get install salt-minion
```

for the first state-apply, must use `--local`. afterwards, the minion configuration allows for dropping the `--local`

```
salt-call --local --file-root=$(pwd) state.apply
```
