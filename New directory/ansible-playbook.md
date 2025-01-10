 ansible playbook is yaml file, each playbook contains tasks:
 playbook.yml 
 playbook1.yml    
     task1
         task2


 playbook2.yml    
     task1
         task2


 note that always we need to use space instead of tab. 
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml

```
yaml file format :
```bash
---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: update apt cache
      apt:
        update_cache: yes


```

```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml
---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: update apt cache
      apt:
        update_cache: yes
    - name: update nginx on all servers
      apt:
        name: nginx
        state: latest
```


```bash
root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --ask-become-pass
```
answer:
```bash
BECOME password:

PLAY [install nginx on servers] ****************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [server-2]
ok: [server-1]

TASK [update apt cache] ************************************************************************************************************************************************
changed: [server-2]
changed: [server-1]

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

get information of hardwares and setup information of all hosts:(note that all items that are shown by this could be separately be extracted by debug module)
```bash
root@srv1:/home/ansible/inventory# ansible -m setup -i hosts.ini all
```


get information of hardwares and setup information of all hosts:
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml
---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: print ip addresses
      debug:
      var: "ansible_all_ipv4_addresses"


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
    " ansible_all_ipv4_addresses": [
        "192.168.1.12",
        "192.168.1.34"
    ]
}
ok: [server-2] => {
    " ansible_all_ipv4_addresses": [
        "192.168.1.13",
        "192.168.1.38"
    ]
}

PLAY RECAP *************************************************************************************************************************************************************
server-1                   : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```
how to get data from different servers by defining a register
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml                               ---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: ip addresses extract
      debug:
        var: "ansible_bios_version"

    - name: echo file
      shell: echo "hello world"
      register: shell_output

    - name: display the output
      debug:
        msg: "the output command is : {{shell_output}}"
~
```
result
```bash
root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --ask-become-pass
BECOME password:

PLAY [install nginx on servers] ***************************************************

TASK [Gathering Facts] ************************************************************
ok: [server-2]
ok: [server-1]

TASK [ip addresses extract] *******************************************************
ok: [server-1] => {
    "ansible_bios_version": "VirtualBox"
}
ok: [server-2] => {
    "ansible_bios_version": "VirtualBox"
}

TASK [echo file] ******************************************************************
changed: [server-2]
changed: [server-1]

TASK [display the output] *********************************************************
ok: [server-1] => {
    "msg": "the output command is : {'changed': True, 'stdout': 'hello world', 'stderr': '', 'rc': 0, 'cmd': 'echo \"hello world\"', 'start': '2025-01-03 19:28:45.495423', 'end': '2025-01-03 19:28:45.499766', 'delta': '0:00:00.004343', 'msg': '', 'stdout_lines': ['hello world'], 'stderr_lines': [], 'failed': False}"
}
ok: [server-2] => {
    "msg": "the output command is : {'changed': True, 'stdout': 'hello world', 'stderr': '', 'rc': 0, 'cmd': 'echo \"hello world\"', 'start': '2025-01-03 19:28:45.419025', 'end': '2025-01-03 19:28:45.422424', 'delta': '0:00:00.003399', 'msg': '', 'stdout_lines': ['hello world'], 'stderr_lines': [], 'failed': False}"
}

PLAY RECAP ************************************************************************
server-1                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

for finding the result without some more information ,in file "the output command is : {{shell_output.stdout}}"
should be modified
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml                               ---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: ip addresses extract
      debug:
        var: "ansible_bios_version"

    - name: echo file
      shell: hostname -I
      register: shell_output

    - name: display the output
      debug:
        msg: "the output command is : {{shell_output.stdout}}"
~
```
result
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml                               root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --ask-become-pass
BECOME password:

PLAY [install nginx on servers] ***************************************************

TASK [Gathering Facts] ************************************************************
ok: [server-2]
ok: [server-1]

TASK [ip addresses extract] *******************************************************
ok: [server-1] => {
    "ansible_bios_version": "VirtualBox"
}
ok: [server-2] => {
    "ansible_bios_version": "VirtualBox"
}

TASK [echo file] ******************************************************************
changed: [server-1]
changed: [server-2]

TASK [display the output] *********************************************************
ok: [server-1] => {
    "msg": "the output command is : {'changed': True, 'stdout': '192.168.1.12 192.168.1.34 ', 'stderr': '', 'rc': 0, 'cmd': 'hostname -I', 'start': '2025-01-03 19:36:46.650018', 'end': '2025-01-03 19:36:46.657984', 'delta': '0:00:00.007966', 'msg': '', 'stdout_lines': ['192.168.1.12 192.168.1.34 '], 'stderr_lines': [], 'failed': False}"
}
ok: [server-2] => {
    "msg": "the output command is : {'changed': True, 'stdout': '192.168.1.13 192.168.1.38 ', 'stderr': '', 'rc': 0, 'cmd': 'hostname -I', 'start': '2025-01-03 19:36:46.558940', 'end': '2025-01-03 19:36:46.569801', 'delta': '0:00:00.010861', 'msg': '', 'stdout_lines': ['192.168.1.13 192.168.1.38 '], 'stderr_lines': [], 'failed': False}"
}

PLAY RECAP ************************************************************************
server-1                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@srv1:/home/ansible/inventory# vim playbook.yaml                               root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --ask-become-pass
BECOME password:

PLAY [install nginx on servers] ***************************************************

TASK [Gathering Facts] ************************************************************
ok: [server-2]
ok: [server-1]

TASK [ip addresses extract] *******************************************************
ok: [server-1] => {
    "ansible_bios_version": "VirtualBox"
}
ok: [server-2] => {
    "ansible_bios_version": "VirtualBox"
}

TASK [echo file] ******************************************************************
changed: [server-1]
changed: [server-2]

TASK [display the output] *********************************************************
ok: [server-1] => {
    "msg": "the output command is : 192.168.1.12 192.168.1.34 "
}
ok: [server-2] => {
    "msg": "the output command is : 192.168.1.13 192.168.1.38 "
}

PLAY RECAP ************************************************************************
server-1                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server-2                   : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


```

check the file/folder is existed on all servers or not:
new items :ignore_errors: yes, when: file_check.rc == 0
as we know , if the command does not run in server and faced an error, we use them
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml                               ---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: ip addresses extract
      debug:
        var: "ansible_bios_version"

    - name: echo file
      shell: hostname -I
      register: shell_output

    - name: display the output
      debug:
        msg: "the output command is : {{shell_output.stdout}}"

    - name: check if file exists
      shell: ls /tmp/file
      register: file_check
      ignore_errors: yes

    - name: print file exist message
      debug:
        msg: "file exist"
      when: file_check.rc == 0

    - name: print file does not exist
      debug:
        msg: " file does not exist"
      when: file_check.rc != 0
```

file existence sample :
```bash
root@srv1:/home/ansible/inventory# vim playbook.yaml                               ---
- name : install nginx on servers
  hosts: all
  become: yes
  tasks:
    - name: ip addresses extract
      debug:
        var: "ansible_bios_version"

    - name: echo file
      shell: hostname -I
      register: shell_output

    - name: display the output
      debug:
        msg: "the output command is : {{shell_output.stdout}}"

    - name: check if file exists
      shell: ls /home/ramin
      register: file_check
      ignore_errors: yes

    - name: print file exist message
      debug:
        msg: "file exist"
      when: file_check.rc == 0

    - name: print file does not exist
      debug:
        msg: " file does not exist"
      when: file_check.rc != 0

      
~
root@srv1:/home/ansible/inventory# ansible-playbook -i hosts.ini playbook.yaml --as 
```


```bash
# several module installation with loop / other method
# 1)method 1
    - name: install package on debian base system
      apt:
        name:
          - vim
          - git
          - sl 
          - curl
          - htop
          - nload
        state: present
      when: ansible_facts['os_family']=="Debian"

# 2)method2
    - name: install package on debian base system
      apt:
        name: "{{item}}"
        state: absent
        loop:
          - vim
          - git
          - sl 
          - curl
          - htop
          - nload
        
      when: ansible_facts['os_family']=="Debian"
# 3)method3
          - name: install package on debian base system
      apt:
        name: ["vim","git","nginx"]
        state: absent
      when: ansible_facts['os_family']=="Debian"
```

Copy module
```bash
    - name: copy file
      copy:
        src: /home/file1
        dest: /home/ramin
        owner:
        group:
        mode: '0644'
```
```bash
    - name: copy file
      copy:
        content : "salam"
        dest: /home/ramin
        owner: ramin
        group: root
        mode: '0644'
```
commnad of services:
```bash
root@srv1:/home/ansible/inventory# cat playbook.yaml
---
 - name : install nginx on servers
   hosts: all
   become: yes
   tasks:
     - name: restart the service
       service:
         name: nginx
         state: restarted
         enabled: yes

```
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

```

```
