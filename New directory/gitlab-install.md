# Run This command for update your Ubuntu
``` bash
sudo apt update && apt upgrade -y
```

# install dependecies
```bash
sudo apt install -y curl openssh-server ca-certificates tzdata perl
```


# set static ip address
```bash
root@srv1:/etc/netplan# nano 50-cloud-init.yaml
root@srv1:/etc/netplan#
root@srv1:/etc/netplan#
```
```s
root@srv1:/etc/netplan# cat 50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        enp0s3:
            dhcp4: no
            addresses:
            - 192.168.152.10/24
            gateway4: 192.168.152.61
            nameservers:
                addresses: [10.202.10.202, 10.202.10.202]
                search: []
    version: 2
root@srv1:/etc/netplan# netplan try
```

# add gitlab repository

``` bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee
sudo vim /etc/gitlab/gitlab.rb
#set external ip in gitlab.rb
ramin@srv1:~$ sudo nano /etc/gitlab/gitlab.rb
root@srv1:/etc/gitlab# sudo EXTERNAL_URL="https://192.168.152.11" apt install gitlab-ee
root@srv1:/etc/gitlab# sudo gitlab-ctl reconfigure
```


check the firewall:
```bash
sudo ufw allow http
sudo ufw allow https
```
#see the gitlab: http://192.168.152.11