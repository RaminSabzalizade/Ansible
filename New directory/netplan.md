```bash
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        enp0s3:
            dhcp4: yes
            addresses:
            - 192.168.1.11/24
            gateway4: 192.168.1.1
            nameservers:
                addresses: [8.8.8.8]
    version: 2
~
~
~
```
