```bash
# install ansible 
# first again check the ips
sudo apt install ansible

# check the version of ansible 
root@srv1:/etc/netplan# ansible --version
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Nov  6 2024, 18:32:19) [GCC 13.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

```


```bash
#ansible directories
ansible directory structure:
1)  inventory : put list of servers inside it
2)  roles 
3)  tasks
4)  Handler : put routine tasks inside it : like restart ssh servers during several activities
5)  files : the files without any changes
6)  template : copy file in server,then need to put server ip inside it
7)  group vars
8)  host vars
9)  meta : meta data of ansible: extra info of ansible file writer.

```


```bash
#python version checking
# pyhton should be installed on all servers if not installed apt installed python3
python3 --version
root@srv1:/etc/netplan# python3 --version
Python 3.12.3

#directory of installed python:
root@srv1:/home/ansible/inventory# which python3
/usr/bin/python3

```


```bash
# how to start with ansible
## 1st item ishaving a directory of inventory
root@srv1:/home# mkdir ansible
root@srv1:/home# ls
ansible  ramin
root@srv1:/home# cd ansible
root@srv1:/home/ansible# mkdir inventory
# inside the inventory file, we should have .ini .yml .yaml file that we need to put the servers ip inside it.mostly .ini is used.

# servers could be duplicated and commands could be run mutiple times
root@srv1:/home/ansible/inventory# vim hosts.ini
[all]

server-1  ansible_host=192.168.1.12
server-2  ansible_host=192.168.1.13



[all:vars]
ansible_user=ramin
ansible_port=22
ansible_python_interpreter="/usr/bin/python3"
#directory of installed python: root@srv1:/home/ansible/inventory# which python3 /usr/bin/python3


# note that it is needed to generate the public key and then copy to target servers and finally do commands :
#generate public key
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "ramin.sabzalizade@gmail.com"

# copy to target servers :
ssh-copy-id -i ~/.ssh/id_ed25519.pub ramin@192.168.1.12
ssh-copy-id -i ~/.ssh/id_ed25519.pub ramin@192.168.1.13

# otherwise you will face below errors :
root@srv1:/home/ansible/inventory# root@srv1:/home/ansible/inventory# ansible -i hosts.ini all -m ping
The authenticity of host '192.168.1.13 (192.168.1.13)' can't be established.
ED25519 key fingerprint is SHA256:JQb3W80gG5kocCS5Hnz3NeorM7mFyM7aLJ8ZMSQzJBM.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:2: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? server-1 | UNR                                                                                     EACHABLE! => {
    "changed": false,
    "msg": "Failed to connect to the host via ssh: ramin@192.168.1.12: Permission d                                                                                     enied (publickey,password).",
    "unreachable": true
}
123
Please type 'yes', 'no' or the fingerprint: yes
server-2 | UNREACHABLE! => {
    "changed": false,
    "msg": "Failed to connect to the host via ssh: Warning: Permanently added '192.                                                                                     168.1.13' (ED25519) to the list of known hosts.\r\nramin@192.168.1.13: Permission d                                                                                     enied (publickey,password).",
    "unreachable": true
}
```

```bash
# which server command run
root@srv1:/home/ansible/inventory# ansible --list-host -i hosts.ini all
  hosts (2):
    server-1
    server-2
```
```bash
# check the time that server is up: 
root@srv1:/home/ansible/inventory# ansible -m command -a "uptime" -i hosts.ini all
server-2 | CHANGED | rc=0 >>
 18:21:23 up  2:18,  1 user,  load average: 0.08, 0.02, 0.01
server-1 | CHANGED | rc=0 >>
 18:21:23 up  2:18,  3 users,  load average: 0.09, 0.08, 0.03
```


```bash
#check the df -h :
root@srv1:/home/ansible/inventory# ansible -m command -a "df -h" -i hosts.ini all
server-2 | CHANGED | rc=0 >>
Filesystem                    Size  Used Avail Use% Mounted on
tmpfs                         392M  1.1M  391M   1% /run
/dev/mapper/ubuntu--vg-lv--0   96G  6.8G   85G   8% /
tmpfs                         2.0G     0  2.0G   0% /dev/shm
tmpfs                         5.0M     0  5.0M   0% /run/lock
/dev/sda2                     2.0G   95M  1.7G   6% /boot
tmpfs                         392M   12K  392M   1% /run/user/1000
server-1 | CHANGED | rc=0 >>
Filesystem                    Size  Used Avail Use% Mounted on
tmpfs                         392M  1.1M  391M   1% /run
/dev/mapper/ubuntu--vg-lv--0   96G  6.5G   85G   8% /
tmpfs                         2.0G     0  2.0G   0% /dev/shm
tmpfs                         5.0M     0  5.0M   0% /run/lock
/dev/sda2                     2.0G   95M  1.7G   6% /boot
tmpfs                         392M   12K  392M   1% /run/user/1000
root@srv1:/home/ansible/inventory#
```

```bash
# for some commands needs to be root user : the error:
root@srv1:/home/ansible/inventory# ansible -m command -a "iptables -nvL" -i hosts.ini all
server-2 | FAILED | rc=4 >>
iptables v1.8.10 (nf_tables): Could not fetch rule set generation id: Permission denied (you must be root)non-zero return code
server-1 | FAILED | rc=4 >>
iptables v1.8.10 (nf_tables): Could not fetch rule set generation id: Permission denied (you must be root)non-zero return code


# how to solve it:
# first need to add the ramin 
root@srv1:/home/ansible/inventory# ansible -m command -a "sudo iptables -nvL" -i hosts.ini all --become --ask-become-pass
BECOME password:
server-1 | CHANGED | rc=0 >>
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

# -put limitation on server by -l
root@srv1:/home/ansible/inventory# ansible -m command -a "sudo iptables -nvL" -i hosts.ini all --become --ask-become-pass -l server-1                                 BECOME password:
server-1 | CHANGED | rc=0 >>
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination    


# generate files on servers:
root@srv1:/home/ansible/inventory# ansible -m command -a "touch /etc/ansible_file" -i hosts.ini  all --become --ask-become-pass
BECOME password:
server-1 | CHANGED | rc=0 >>


# echo file
root@srv1:/home/ansible/inventory# ansible -m shell -a "echo 'salam' > /etc/ansible_file" -i hosts.ini all --become --ask-become-pass --become-method=sudo
root@srv1:/home/ansible/inventory# ansible -m command -a "echo 'salam ' /etc/ansible_file" -i hosts.ini  all --become --ask-become-pass --become-method=sudo 


# # 3 model modules are important :
#   1 command : >,%,>>,|, MANY OTHER SPECIAL COMMANDS ... these are not supported by command module, so it is needed to use shell
#   2 shell
#   3 raw  : for servers without raw

# module copy: note that file1.log should be existed in source file, then try from source 
root@srv1:/home/ansible/inventory# ansible -m copy -a "src=./file1.log dest=/home/file1.log" -i hosts.ini all --become --ask-become-pass --become-method=sudo -vvv


# make group of servers
[all]

server-1  ansible_host=192.168.1.12
server-2  ansible_host=192.168.1.13

[deb]
server-1

[rhel]
server-2

[all:vars]
ansible_user=ramin
ansible_port=22
ansible_python_interpreter="/usr/bin/python3"


~



# packet install module  apt  on rhel ,not on deb ones:sample of group

root@srv1:/home/ansible/inventory# ansible -m apt -a "name=nginx state=present" -i hosts.ini rhel --become --ask-become-pass --become-method=sudo


# run in all servers
```bash
root@srv1:/home/ansible/inventory# ansible -m apt -a "name=nginx state=present" -i hosts.ini all --become --ask-become-pass --become-method=sudo
```

```bash
# add version
root@srv1:/home/ansible/inventory# ansible -m apt -a "name=nginx=1.25 state=present" -i hosts.ini all --become --ask-become-pass --become-method=sudo
```

```bash
root@srv1:/home/ansible/inventory# ansible -m apt -a "name=nginx state=present" -i hosts.ini all --become --ask-become-pass --become-method=sudo
BECOME password:
server-1 | FAILED! => {
    "cache_update_time": 1735833577,
    "cache_updated": false,
    "changed": false,
    "msg": "'/usr/bin/apt-get -y -o \"Dpkg::Options::=--force-confdef\" -o \"Dpkg::                                                                                     Options::=--force-confold\"       install 'nginx=1.24.0-2ubuntu7.1'' failed: E: dpk                                                                                     g was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the                                                                                      problem. \n",
    "rc": 100,
    "stderr": "E: dpkg was interrupted, you must manually run 'sudo dpkg --configur                                                                                     e -a' to correct the problem. \n",
    "stderr_lines": [
        "E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a'                                                                                      to correct the problem. "
    ],
    "stdout": "",
    "stdout_lines": []
}
server-2 | SUCCESS => {
    "cache_update_time": 1734247716,
    "cache_updated": false,
    "changed": false
}

```

# note:  i faced an error for one server, The error message indicates that dpkg (the underlying package manager for Debian-based systems) was interrupted on server-1 and is in a broken state. This needs to be resolved manually or programmatically before continuing with the Ansible task.

# Fix the dpkg Issue on server-1: Manually log into server-1 and run the following command to resolve the dpkg issue:

```bash
sudo dpkg --configure -a
```
```bash
#  This will fix the interrupted dpkg process and allow apt to work normally. 
```
```bash
#  check the activities on other servers : 
ps -fax
ps -aux
```


```bash
# how to upgrade packages on servers :
root@srv1:/home/ansible/inventory# ansible -m apt -a "upgrade=yes update_cache=yes" -i hosts.ini all --become --ask-become-pass --become-method=sudo
BECOME password:
```


```bash

# how to use raw module
root@srv1:/home/ansible/inventory# ansible -m raw -a "ls -lah" -i hosts.ini all --become --ask-become-pass --become-method=sudo
BECOME password:
server-1 | CHANGED | rc=0 >>

total 36K
drwxr-x--- 5 ramin ramin 4.0K Jan  2 16:04 .
drwxr-xr-x 3 root  root  4.0K Jan  3 10:56 ..
drwxrwxr-x 3 ramin ramin 4.0K Jan  2 16:04 .ansible
-rw------- 1 ramin ramin  283 Jan  3 08:07 .bash_history
-rw-r--r-- 1 ramin ramin  220 Mar 31  2024 .bash_logout
-rw-r--r-- 1 ramin ramin 3.7K Mar 31  2024 .bashrc
drwx------ 2 ramin ramin 4.0K Dec 15 07:38 .cache
-rw-r--r-- 1 ramin ramin  807 Mar 31  2024 .profile
drwx------ 2 ramin ramin 4.0K Jan  2 18:05 .ssh
-rw-r--r-- 1 ramin ramin    0 Jan  2 13:28 .sudo_as_admin_successful
Shared connection to 192.168.1.12 closed.

server-2 | CHANGED | rc=0 >>

total 36K
drwxr-x--- 5 ramin ramin 4.0K Jan  3 08:47 .
drwxr-xr-x 3 root  root  4.0K Jan  3 10:56 ..
drwx------ 3 ramin ramin 4.0K Jan  3 08:47 .ansible
-rw------- 1 ramin ramin   27 Jan  3 08:07 .bash_history
-rw-r--r-- 1 ramin ramin  220 Mar 31  2024 .bash_logout
-rw-r--r-- 1 ramin ramin 3.7K Mar 31  2024 .bashrc
drwx------ 2 ramin ramin 4.0K Dec 15 07:38 .cache
-rw-r--r-- 1 ramin ramin  807 Mar 31  2024 .profile
drwx------ 2 ramin ramin 4.0K Dec 15 07:32 .ssh
-rw-r--r-- 1 ramin ramin    0 Jan  3 08:32 .sudo_as_admin_successful
Shared connection to 192.168.1.13 closed.
```


```bash
# ansible documentory : ansible-doc modulename

root@srv1:/home/ansible/inventory# ansible-doc copy
# list of documnets
root@srv1:/home/ansible/inventory# ansible-doc -l
```

get information of hardwares and setup information of all hosts:
note
```bash
root@srv1:/home/ansible/inventory# ansible -m setup -i hosts.ini all
```
```bash
root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --ask-become-pass
BECOME password:

PLAY [install nginx on servers] ****************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [server-2]
ok: [server-1]

TASK [ip addresses extract] ********************************************************************************************************************************************
ok: [server-1] => {
    "ansible_bios_version": "VirtualBox"
}
ok: [server-2] => {
    "ansible_bios_version": "VirtualBox"
}

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

```



