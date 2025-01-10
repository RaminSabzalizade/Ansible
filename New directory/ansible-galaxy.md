ansible roles: ansible role directory structure search in google
define base packages in one yaml file/install separate daabases on different yaml file. 

Ansible checks for main.yml files, possible variations, and relevant content in each subdirectory. It’s possible to include additional YAML files in some directories. For instance, you can group your tasks in separate YAML files according to some characteristic.

defaults –  Includes default values for variables of the role. Here we define some sane default variables, but they have the lowest priority and are usually overridden by other methods to customize the role.
files  – Contains static and custom files that the role uses to perform various tasks.
handlers – A set of handlers that are triggered by tasks of the role. 
meta – Includes metadata information for the role, its dependencies, the author, license, available platform, etc.
tasks – A list of tasks to be executed by the role. This part could be considered similar to the task section of a playbook.
templates – Contains Jinja2 template files used by tasks of the role. (Read more about how to create an Ansible template.)
tests – Includes configuration files related to role testing.
vars – Contains variables defined for the role. These have quite a high precedence in Ansible.
Introduction.
Role Directory Structure.
defaults:
vars:
tasks:
files:
templates:
meta:
```bash
root@srv1:/home/ansible# tree .
.
└── inventory
    ├── file1.log
    ├── hosts.ini
    └── playbook.yaml

root@srv1:/home/ansible# mkdir roles


# make directory of main.yaml and it is needed to make  priority of tasks

root@srv1:/home/ansible# vim main.yaml
root@srv1:/home/ansible# cat main.yaml
- hosts: all
  roles:
      - role : preinstall
  gather_fact: yes    # take the setup part into consideration
  any-errors_fatals: true # take the errors




root@srv1:/home/ansible/roles# ansible-galaxy init preinstall
- Role preinstall was created successfully
root@srv1:/home/ansible# tree .
.
├── inventory
│   ├── file1.log
│   ├── hosts.ini
│   └── playbook.yaml
└── roles
    └── preinstall
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   └── main.yml
        ├── templates
        ├── tests
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml


root@srv1:/home/ansible/roles# ansible-galaxy init install
- Role install was created successfully

root@srv1:/home/ansible# tree
.
├── inventory
│   ├── file1.log
│   ├── hosts.ini
│   └── playbook.yaml
├── main.yaml
└── roles
    ├── install
    │   ├── defaults
    │   │   └── main.yml
    │   ├── files
    │   ├── handlers
    │   │   └── main.yml
    │   ├── meta
    │   │   └── main.yml
    │   ├── README.md
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   ├── tests
    │   │   ├── inventory
    │   │   └── test.yml
    │   └── vars
    │       └── main.yml
    └── preinstall
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   └── main.yml
        ├── templates
        ├── tests
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml

21 directories, 20 files

```
sample change the UTC

```bash
# create  main.yaml file after making the inventory and galaxy files

root@srv1:/home/ansible# cat main.yaml
- hosts: all
  roles:
    - role: preinstall
  gather_facts: yes
  any_errors_fatal: yes



root@srv1:/home/ansible# cat roles/preinstall/tasks/main.yml

# tasks file for preinstall

- name: Set timezone
  timezone:
    name: Etc/UTC
```


add another task for changing the hostname
variables in linux is used by {{}}


```bash

root@srv1:/home/ansible# cat roles/preinstall/tasks/main.yml

# tasks file for preinstall

- name: Set timezone
  timezone:
    name: Etc/UTC

- name: Set hostname
  command: hostnamectl set-hostname {{inventory_hostname}}

root@srv1:/home/ansible# ansible-playbook  -i inventory/hosts.ini   main.yaml --become --become-method=sudo

PLAY [all] *************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set timezone] ***************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set hostname] ***************************************************************************************************************************************
changed: [server-2]
changed: [server-1]

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


```


```bash
root@srv1:/home/ansible# vim roles/preinstall/tasks/main.yml

# tasks file for preinstall

- name: Set timezone
  timezone:
    name: Etc/UTC

- name: Set hostname
  command: hostnamectl set-hostname {{ inventory_hostname }}

- name: Add hostname to /etc/hosts
  lineinfile:
    path: /etc/hosts
    regexp: '^127\.0\.1\.1'
    line: "127.0.1.1 {{ inventory_hostname }}"
    state: present

```

define variables
define directory and yaml file in below directories
```bash
root@srv1:/home/ansible/inventory# mkdir group_vars

root@srv1:/home/ansible/inventory/group_vars# cat all.yaml
etc_hosts_path: "/etc/hosts"


# tasks file for preinstall

- name: Set timezone
  timezone:
    name: Etc/UTC

- name: Set hostname
  command: hostnamectl set-hostname {{ inventory_hostname }}

- name: Add hostname to /etc/hosts
  lineinfile:
    path: "{{ etc_hosts_path }}"
    regexp: '^127\.0\.1\.1'
    line: "127.0.1.1 {{ inventory_hostname }}"
    state: present
~
```
Install necessary packages and fix an error
```
root@srv1:/home/ansible# vim roles/preinstall/tasks/main.yml

# tasks file for preinstall

- name: Set timezone
  timezone:
    name: Etc/UTC

- name: Set hostname
  command: hostnamectl set-hostname {{ inventory_hostname }}

- name: Add hostname to /etc/hosts
  lineinfile:
    path: "{{ etc_hosts_path }}"
    regexp: '^127\.0\.1\.1'
    line: "127.0.1.1 {{ inventory_hostname }}"
    state: present

- name: Fix broken dpkg state
  command: sudo dpkg --configure -a
  become: true
  ignore_errors: yes



- name: Install necessary packages
  apt:
    name:
      - vim
      - sudo
      - wget
      - curl
      - git
      - nload
      - net-tools
      - htop
    state: present
    update_cache: yes
```
and result
```bash
root@srv1:/home/ansible# ansible-playbook -i inventory/hosts.ini  main.yaml --become --become-method=sudo

PLAY [all] *************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set timezone] ***************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set hostname] ***************************************************************************************************************************************
changed: [server-1]
changed: [server-2]

TASK [preinstall : Add hostname to /etc/hosts] *************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Fix broken dpkg state] ******************************************************************************************************************************
changed: [server-2]
changed: [server-1]

TASK [preinstall : Install necessary packages] *************************************************************************************************************************
ok: [server-2]
changed: [server-1]

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=6    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0



```
what was the errors:
- name of applications
- errors on servers (apt/dpkg clash)
- internet access


```bash
root@srv1:/home/ansible# ansible-playbook -i inventory/hosts.ini  main.yaml --becom                                                                                     e --become-method=sudo

PLAY [all] ************************************************************************

TASK [Gathering Facts] ************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set timezone] **************************************************
ok: [server-2]
ok: [server-1]

TASK [preinstall : Set hostname] **************************************************
changed: [server-2]
changed: [server-1]

TASK [preinstall : Add hostname to /etc/hosts] ************************************
ok: [server-2]
ok: [server-1]

TASK [preinstall : Install necessary packages] ************************************
changed: [server-2]
fatal: [server-1]: FAILED! => {"cache_update_time": 1736494629, "cache_updated": tr                                                                                     ue, "changed": false, "msg": "'/usr/bin/apt-get -y -o \"Dpkg::Options::=--force-con                                                                                     fdef\" -o \"Dpkg::Options::=--force-confold\"       install 'nload=0.7.4-2build3' '                                                                                     net-tools=2.10-0.1ubuntu4'' failed: E: dpkg was interrupted, you must manually run                                                                                      'sudo dpkg --configure -a' to correct the problem. \n", "rc": 100, "stderr": "E: dp                                                                                     kg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the                                                                                      problem. \n", "stderr_lines": ["E: dpkg was interrupted, you must manually run 'su                                                                                     do dpkg --configure -a' to correct the problem. "], "stdout": "", "stdout_lines": [                                                                                     ]}

NO MORE HOSTS LEFT ****************************************************************

PLAY RECAP ************************************************************************
server-1                   : ok=4    changed=1    unreachable=0    failed=1    skip                                                                                     ped=0    rescued=0    ignored=0
server-2                   : ok=5    changed=2    unreachable=0    failed=0    skip                                                                                     ped=0    rescued=0    ignored=0


```
to solve this error, below task is added
```bash

- name: Fix broken dpkg state
  command: sudo dpkg --configure -a
  become: true
  ignore_errors: yes



```

prioritize roles:
first add new roles on roles folder
then modify the main.yaml file
and then add tasks
```bash
#1st step
root@srv1:/home/ansible# cd roles/
root@srv1:/home/ansible/roles# ansible-galaxy init basic
- Role basic was created successfully


# 2nd step
root@srv1:/home/ansible# cat main.yaml
- hosts: all
  roles:
    - role: preinstall
    - role: basic # this part is added
  gather_facts: yes
  any_errors_fatal: yes

#3rd part 

# add task whatever you want
```

file transfering in file directory 
put a file inside the file of roles/basic/file
add the code to the main.yaml inside the first batch
add the code inside the  basic/tasks
```bash
# make a file in this directory
root@srv1:/home/ansible/roles/basic/files# ls
issue.net


#add the basic role into role directory{priority of preinstall is higher than basic}
root@srv1:/home/ansible# cat main.yaml
- hosts: all
  roles:
    - role: preinstall
    - role: basic # this part is added
  gather_facts: yes
  any_errors_fatal: yes


# now without adding the src location by only putting the name, it could be changed.
root@srv1:/home/ansible/roles/basic/tasks# cat main.yml
---
# tasks file for basic

- name : copy file from source in file folder to other servers
  copy:
    src: issue.net
    dest: /etc/issue.net



 #finally run the commands
root@srv1:/home/ansible# ansible-playbook -i inventory/hosts.ini main.yaml --become --become-method=sudo

PLAY [all] *************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set timezone] ***************************************************************************************************************************************
ok: [server-1]
ok: [server-2]

TASK [preinstall : Set hostname] ***************************************************************************************************************************************
changed: [server-1]
changed: [server-2]

TASK [preinstall : Add hostname to /etc/hosts] *************************************************************************************************************************
ok: [server-2]
ok: [server-1]

TASK [preinstall : Fix broken dpkg state] ******************************************************************************************************************************
changed: [server-1]
changed: [server-2]

TASK [preinstall : Install necessary packages] *************************************************************************************************************************
ok: [server-2]
ok: [server-1]

TASK [basic : copy file from source in file folder to other servers] ***************************************************************************************************
changed: [server-2]
changed: [server-1]

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=7    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=7    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

```bash

root@srv1:/home/ansible# cat roles/basic/tasks/main.yml
---
# tasks file for basic

- name : copy file from source in file folder to other servers
  copy:
    src: issue.net
    dest: /etc/issue.net

- name: add banner to sshd config
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^Banner'
    line: 'Banner /etc/issue.net'

- name:  Restart the service
  service:
    name: ssh
    state: restarted

```


```
