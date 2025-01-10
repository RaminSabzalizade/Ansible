
How to solve the sudo password:
make a file and put the username, then write the below context on etc/sudoers.d folder
```bash

root@srv1:/etc/sudoers.d# ls
ramin  README

root@srv1:/etc/sudoers.d# cat ramin
milad ALL=(ALL) NOPASSWD:ALL
```