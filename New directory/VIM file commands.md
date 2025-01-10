
# VIM  

# install dependecies
```bash
Sudo VIM
```
result 
```sql
~                                                  VIM - Vi IMproved                                                    ~                                                                                                                       ~                                                   version 9.1.697                                                     ~                                               by Bram Moolenaar et al.                                                ~                                       Modified by team+vim@tracker.debian.org                                         ~                                     Vim is open source and freely distributable                                       ~                                                                                                                       ~                                            Become a registered Vim user!                                              ~                                    type  :help register<Enter>   for information                                      ~                                                                                                                       ~                                    type  :q<Enter>               to exit                                              ~                                    type  :help<Enter>  or  <F1>  for on-line help                                     ~                                    type  :help version9<Enter>   for version info  

```

```bash
## to use the vim,:q+enter to exit ,i to write.
## in vim page, press i to write sth in page, press Esc to go the end of the page then press :q! / :wq! .

# after ESC please enter :
## 1 ^ /shift I ==> start of the line.
## 2 $/shift A==> end of the line.
## 3 gg ==> start of the text.
## 4 45gg ==> 45th row.
## 5 0 / ==> 45th row.
## 6 a/A ==> let you to go to the later string 
## 7 o/O ==> enter a down/up a new row and the go the insert mode
## insert mode : iI oO aA 
## rR go to the replace mode
## CW clean the word
## shift C clean the remain part of line.
## CC whole line clean
## 5CC clean 5m lines
## dw delete word
## 5dw delete 5 words
## d$delete the sentence
## dd delete line
## ^d 
## yy copy a line and p under/ P upper paste a line
## hjkl rotator
## dap delete a paragraph

# search in file by VIM
## /the string of search + enter + n(next)
## /nginx --> if N in the reverse side
# search and replace
## it could be done in different methods
## :s/sting of search/new replace/+ enter ==> change the first one.
## :s/string of search/new replace/g ==> in the line that cursor is there.
## :%s/string of search/new repelace/g ==> in the whole file 
## :%s/string of search/new replace/gc ==> confirm is required
## :%s/string of search/new replace/gic ==> confirm without Aa(gci/gic)

# save the file
## :w save the file
## :w /tmp/x.txt save the file in directory
## :q! quit the file without the save = :ZQ
## :wq save and quit
## :x save and quit the file
## :ZZ save and quit the file
## :wq! save and quit even it was not writable file

# check the commands in VIM
## :!ls /tmp shell command
## :e! dont consider changes and reload the file again.

# visual block(make like a txt file in windows)
## :ctrl+v 
## :shift+i
## select a part of txt and put what you want
## 2 escape and exit


# how to open new tab
## :tabnew
## :tabNext :tabPrevious change the tab
## : new /xx.txt

# how to differentiate among 2 files
## root#vimdiff file1 file2
## :diffget --> from file2 to file1
## :diffput --> from file1 to file2

```

# echo show the everything that you right
```bash
$echo devops
$echo devops | linux ==> error for |(special character) instead use: 
$echo devops \| linux
$echo devops ; linux ==>error
$echo devops \; linux 
$echo "devops ; linux"
$echo devops \tlinux \tclass ==> provide tab between outputs
$echo -e devops \vlinux \vclass ==> provide vertical tab between outputs
$echo -e devops \vlinux \vclass ==> change the line
# means comment linux
$ls /tmp/ ; cd /home/ ; ls # linux command line is read this commands and run sequntially without caring about the result 
$ls /home || cd /tmp  #logical OR: run one of them
# && logical and : run both of them
$ls /home || cd /tmp
$sudo apt update && sudo apt install htop

#variables = env
$env # shows the vaiables old pWD : shows the previous location
$VAR1= devops1234 #save the variable
$echo $VAR1 #show the content
$unset var1 #delete the variaable


#new bash
$bash
$echo var1 # make new variable with same name in new bash, means it is not constant , it is in ram not hard.
$echo SS #provide the process id to differentiate the bashes
$export var2="linux devops" #constant variable in all bashes
$pwd # print working directory
$sh # new bash that do not show the directory
$echo $? # this command shows the previous command was an error / valid output.if the result shows 0 means output, otherwise an error.
$history # shows the whole commands from installation time in the os, this data is saved in hidden file as follow 
$ls -a # show the hidden files, .bash_hisotory contains
$cat .bash_history

#search in history (ctrl + r)
$(ctrl+r) # in reverse side

$!sudo # provide the latest sudo command that runs
$!vim
$sudo !! # re-run the last commnad that runs with sudo
$history -c # clean the history but it is exist in .bash_history, need to go the file and delete in there by vim :10000dd ---- :wq
$echo salam # if 1 space added to command, it will not appear in history 


#ms mohammadifar document

$uname -a #all below information
$uname # os type
$uname -r #kernel release
$uname -m #machine OS release
$uname -i #hardware platform
$uname -o #OS GNU LINUX
$uname --help


$man # Provide manual information of any command
$man ls
$man cat
$man --help
$man PWD
$man dpkg
$man apt
# tosearch inside this file, it is adequate to /xxxx and n straight and N reverse
$man -f ls


# structure of linux command
# commnad switch option
$ls -a -l -t -r 
# commnad subcommand switch option
$kubectl get 

# patterns > | >> < 
# pipe |  output of file could be input of another file
$cat xx.txt | less
$cat xx.txt | grep -i milad
$cat xx.txt | grep -i milad | grep -i root
$cat xx.txt | grep -i milad | grep -i root > root.txt
$echo " " > .bash_history # remove history easily
$echo " " >> .bash_history # append file
$echo test  file.txt # make new file


$cat > file2.txt # make a file and waits for input 
$cat file1 file2 > file3 #make a file
$cat file1 - file2 # waits for input in - ,after enter the -xx then ctrl+d
$cat -n fil3 # provide  all line number
$nl file # provide number of written line 

$tr # translate
$echo " this is for test 12345" | tr is IS
#output : thIS IS for teSt 12345
$echo tr --help
$echo " this is for test 12345" | tr [:lower] [:upper]
$echo " this is for test 12345" | tr  -d 't' # delete the t
$echo " this is for test 12345" | tr -dc [:digits:] > file1 # keep only digits
$pr filename.txt #print the file include time,page number and file name
$fmt file1.txt  # change the width of paragraph to be readable and adjustable in screen
$fmt -w 12 file1.txt

```

#  session 5
# sort and uniq use together
```bash
$sort file1 # based on first then second and third ....  character is sorting data .(digits have priority than characters)
$sort -n file1 #sort based on number
$uniq file1 #if the file is sorted,the output will be unique.
$sort -n file1 | uniq
$sort -n file1 | uniq -d # show duplicated values
$sort -n file1 | uniq -c #filter only duplicated values
$sort -n file1 | uniq -u #filter only unique values

# split based on size/line
$cat -n file1 #number of lines nl file1
$split -l 3 file1 #split file data into different files with 3 line rules
$yes > file3 # write y in file3
$LS -lh # give info about the folders
$split -l 3 file1 output # output is the name of splitted file.
$split -b 200MB file1 output

$wc #word count # of line,words,character
$wc -l #only number of lines
$head file1 # shows the top 10 rows
$head -n 2 file1 # shows the number of lines
$tail -n 2 file1
$less file1 
$more file1 # input whole data into memory
$sudo apt install termoninator

# delimeter
$cut -d: -f1 file1 # :-d delemeter , -f : column
$cut -d: -f2 file1
$cut -d: -f2 file1 | cut -d, -f1 

# put the files vertically beside each other
$paste file1 file2
#   a       c
#   b       d
#   e       f  
#   h       i
$paste -d_ file1 file2 # delimeter
#   a_c
#   b_d
 
 # find and change and replace in the word
$sed 's/p/P/g' file # replace formula ,change p with P
$sed 's/p/P/gi' file # :%s .
$sed -i 's/p/P/gi' file # change without showing anything
$sed -i 's/ /\t/gi' file # change the space in file to tab

# make new files
$touch file1.txt file2.txt file3.txt
$touch file{1..100}.txt # make many new files
$touch -t 201503231455 test_file
$ls -l test_file

#get status of file
$stat file1 #access time and modify time is changes
$touch test_file # again time is changing to real date

# make a folder
$mkdir dir{1..3}
$mkdir dir1/dir2/dir3 # not possible
$mkdir -p dir1/dir2/dir3
$tree dir1/dir2/dir3 # provide tree of directory
$sudo apt install tree

#copy of directory
$cp -r dir1/dir2/ # copy directory/folder
#-r=-R
$cp file1.txt file2.txt file3.txt directory1/
$cd - # go to last directory/last place
# move and rename the file/folder
$mv dir1 testdir #rename sample
$mv testdir/ /tmp/ # move 
# rm remove a file or folder
$rm file12.txt
$rm -r -f dir2/ #-f force 
$rm -rf dir2/

# filter on file /folder name
$ls ?.txt # filter one character.txt
$ls ??.txtx # filter two character.txt
$ls *.pdf # filter on pdf files

#find 
$rm *.png # remove filtered files
$find / #search all files under the slash/
$find / -name milad # find under the folder of / word milad.case sensitice
$find / -iname milad # not case sensitive
$find / -iname *.conf # not case sensitive
$find / -iname milad -type f # filter on files only
$find / -iname milad -type d # filter on folders only
$find / -iname *.txt -exec rm -rf {} \; # output is send to exec like pipe to run new command
$find / -iname * -type f -size 1k
$find / -iname * -type f -size 5M

#show the file type
$file xx.txt 
$ls -l # differentiate between file and folder

# archive the data -compression tools
$sudo apt install zip
$zip -r myfile.zip dir1/ #zip the file
$unzip myfile.zip
$zip -u # update
$zip -d # delete 
$gzip xaa
$gunzip  xaa.gz
$bzip2 xaa # take abit mode time but more compressed
$bunzip2 xaa.bz2
$xz xaa
$xunz xaa.xz
$tar -cvf myfile.tar xaa # only archive data -create verbus file
$tar -xvf myfile.tar xaa # extract
$tar -czvf myfile.tar.gz xaa # archive  and zip
$tar -cjvf myfile.tar.bz2 xaa # archive and zip
$tar -xzvf myfile.tar.gz xaa # extract

# dd inputfile outputfile- diska with all data is copies on diskb - it is like clone 
$dd if =/dev/sda of=/dev/sdb


```
```bash
# tmux : even if ssh is disconnected / then it continue the work without considering the ssh connectivity
$sudo apt install tmux
$ctrl+b d #for exit
$ctrl+b # change the page
$tmux att -t 0 #connecting to tmux by showing the green tab
$
$tmux ls # show he tmux 
$#ctrl+b -- %
$#ctrl+b -- %
$#crtr + b -- d  --> detach
$#ctrl+b -- % --> split H
$#ctrl+b -- " --> split V

$#ctrl+b -- o --> switch 
$tmux att -t 0
$tmux new-session -s milad


# byobu
# F2 NEW WINDOW
# F3 F4 move the pages after and previous
# F6 detach
# shift+f2 and ctrl+f2 = split horizentally and vertically
# shift+F3  and shift+ f4 ==> SWITCHES BETWEEN PAGES
# SHIFT+F4 ==>
$byobu -enable
$byobu -disable
https://www.byobu.org/


# process status
$ps # provide process id and its time
$ps -a # provide per all users
$ps -au # provide per owner of service
$ps -aux # provide per user from initial time
$ps -fax 
$htop # provide the cpu status 
$pgrep sshd # filter the process of sshd
$sleep 5 #  sleep for 5 seconds to make a delay
$sleep 5000 & # sleep 5000seconds in background
$jobs
$top # status every seconds  shows the zombie(process without parent/make continues child) tasks, #
$swap on
# swap: add RAM/memory by adding the hard disk and configure it a ram. surely its' speed is lower than ram.
$ls / # if swap is exist in os, there is file wth name : swap.img
$swap off -a

#monitoting tools 
$sudo swapoff -a &&sudo swapon -a
$htop # huaman readable top, use k to kill the process
$btop
$free # check the memory
$free -h
$free -g
$free -m # based on mega byte
$free -th
$uptime # number of user/load average, and initial setup time

#put stress on OS
$stress -ng -c 4 # put stress on 4 cpu
$stress -ng -m  100 # put stress on memory
$sudo swapoff -a &&sudo swapon -a # release the memory and cpu

$iostat
$iotop 
$sar # cpu/user
$sar 1 5 # 1second and 5 times

$ifconfig # check the network config status
$netstat -ie 
$netstat -s #icmp packets count and receive
$iftop #ipv4 ipv6
$nload # load on network [changes the pages/ips done by arrows]
$ifload
$ipef -s #transmitter side
$iperf -c # receiver side
$iptraf -ng -i # shows the send/recives packets

#collectd linux
#cacti
#zabbix monitoring



# grep search in files for specific pattern


$grep have file1
$grep have file1 file2
$cat file1 | grep have
$cat file1 | grep have | grep does  # filte on have and if found have in file1 ,again search and find does
$cat file1 | grep have | grep -n -i does #sequence is import -n then -i and then vocab, -n number of lines
$cat file1 | grep have | grep -iv does # Do not consist of does
$cat file1 | grep have | grep -W does # exact 
$grep -ri does #recursive
$grep -ri does dir2/*.xml |sort | uniq | wc -l

[root@OSSM-1 omc]# grep -ri --include="*.xml" "Secondary RAT" /export/home/omc/med | sort > test1
[root@OSSM-1 med]# grep -ri --include="*.xml" "RRC connection setup request" /export/home/omc/med/BTS3900NE | sort | uniq -l > test1
```



```bash
# users and groups: Every users can have access to servers with below methods:
# password/key/pan/active directory(AD)
# make group to clarify the level of access
# LDAP server is a sever that originate the level 

# each user has its own group, ramin user has ramin group
# primary group,man group of a userc
# sudo user modifies the groups of users
 
# to generating a root user , it is need to be sudo user 
$sudo su -
$cat /etc/sudoers.d/milad
# milad ALL=(ALL) NOPASSWD:ALL
$cat etc/sudoers # root user has ALL ,shown as privilege
$id milad(user) # check each user is connected to which group?
# how to generate a user
$useradd adel # username of user, all should be lowercase
$id adel
# where is the user now???which directory?
$cat /etc/passwd # 
# home/adel ??? it seem it makes a folder
#no , switch be passed to it 
$useradd -m yasser # - make home directory
# show yaser place :
$cat /etc/passwd | grep -i yas
# location of yasser directory
$ls /home
# originate of home directory of users in specified place
$useradd -m -d /opt/reza reza
# set password
$passwd reza
#note that user starts from the configured place 
#bin/sh vs bin/bash : the location is sh is not shown
#new user with different shell:
$useradd -m -d /opt/mina -s /bin/bash mina
$cat /etc/passwd | grep -i mina
# bin/bash
# put comment
$useradd -m -d /opt/mina -s /bin/bash -c "zahra mirzayi" zahra
#result :
$cat /etc/passwd | grep -i zahra
# zahra:x:1005:1005:Zahra mirzayi:/opt/zahra:/bin/bash
#1st 1005 user id
#2nd 1005 group id
# wwhy starts from 1000?
# because it is allocated to system users a
#auth.log
$cd /var/log
$cat auth.log

# number of apts to monitor the server 
rsyslog /wazuh /trend macro

$tail -f /var/log/auth.log
$yes> file1
$echo " "> file


$find /var/log/mbackups -maxdepth i -mtime +7 -type -f delete

# a direcotry that if  put file/directory , it is sends to all users home directory 
$cd /etc/skel
$ls #no file exist
#check the hidden files
$ls -a

# to change any options of users
$usermod -s /bin/bash adel
$usermode -c "admin user" admin

# how to lock/UNlock a user
$usermod -L adel
$usermod -U adel

#change the primary group
$usermod -g (groupmode) (username) # rewrite the group
$usermod -g reza adel # primary groups 
$usermod -G reza adel # add additional groups
# append the group /not rewrite
$usermod a-aG reza adel

#user delete
$userdel reza #user is deleted but group is not deleted
$userdel -f -r mina

#group add
$groupadd group1
$cat /etc/group

# define with specified id
$groupadd -g 1100 group2

#modify group-- only name andID could be change
$groupmod -n newgroup group1
$cat etc/group
$groupmod -g 1200 newgroup

#show all users
$cat /etc/passwd

#show users password in hash mode
$cat /etc/shadow
#check the password status
$chage -l milad
#change the password setting
$chage adel 

#patitioning
# check the disk usage
$df -h

#process of assigning a api to a folder
#define fs(file system)->add directory --> install the application--> put app in the directory 

#make a partition

$ls /dev/
# sda disk a/ disk b sdb
# check the config that second disk is added/not 
$lsblk
#mbr master boot record
$fdisk
#gpt
$gdisk


#mbr vs # gbr difference
#again show the disk partiotioning
$fdisk -l
$fdisk -l /dev/sdb # new disk
:m #help
:n #new partition
#mbr has 4 partition limitation
:p
:[enter]
#meta data 1MB is located in the first part of disk and if you lose it,means you lost whole data.
#gpt to address the issue, put duplicated value in different places
:10G
:p #print
:n 

# make file system (properties in drive D windows,shows the NTFS)

$lsblk
----------------
# add new hard disk to linux
# change the data between differnet hardwares
# assume there is an linux server that installed on one hard,
# now another hard is added, first need to makedirecotory on linux on hdd1.
# then you need to mount the file (File system) on hdd2.
```bash
# different
$ #list partition type
# make file system
$mkfs 
# top important file system :
# ext2(limit 16GB)/ext3(compatible with kernel 2.4 or later)/ext4
# ntfs and fat32 belong to windows
# xfs for files with small size of file but with large number 10e+10 with 2kB data
$mkfs -t ext4 /dev/sdb1 # this delete all data on sdb1
$mkfs.ext4 /dev/sdb2
# how to check mkfs is worked
$blkid # check type

# now mounting should be done,MOunt point is left
$lsblk

$ls /
# make a directory
$mkdir /dataSdb1
# mount File system to hard 2
$mount /dev/sdb1 /dataSdb1
$blkid
# shows the number of available node/file that can be imported to disk.
$df -i #inodes shows that value
$vim /etc/fstab
add below:
    /dev/sdb1 /datasdb1 ext4 defaults 0 0
$mount -a
$umont  /dev/sdb1
# all steps of hdd addition
# fdisk /dev/adb --> sdb1 --> mkfs.ext4 /dev/sdb1 --> mount /dev/sdb1 /datasdb1 --> write /etc/fstab --> mount -a

$cat /etc/fstab | grep -i sdb1
some times the name of the hdd sdb/sdc is failed, to solve it it is better to use uuid:
$uuidgen


#for ext file systems:
# there is command 
$fsck
$fsck.ext4 /dev/sdb1
# this command is not working on mounted
#need to be unmonuted

$fsck --help
$fsck -N # this one is important,run command to show the result without execution on hdd
$man fsck
# force to check data
$fsck -f /dev/sdb1
$debugfs
$e2fsck

$xfs_info /dev/sdb1
$xfs_check /dev/sdb1
$xfs_repair /dev/sdb1

# check disk size
# show the size
$lsblk
#disk free(shows the mounted disks)
$df 
$df -h

$du
$du -s # summorized
$du -sh
$du -sh *
$dh -hTi / -t ext4
```
```bash
  161  fsck.ext4 /dev/sdb1
  162  fsck --help 
  163  man fsck 
  164  fsck -f /dev/sdb1 
  165  fsck -f -y /dev/sdb1 
  166  fsck -t ext4 /dev/sdb1 
  167  e2fsck --help 
  168  xfs_info /dev/sdb1 
  169  xfs_check
  170  lsblk 
  171  mount -a 
  172  lsblk 
  173  df 
  174  df -h
  175  df -hT
  176  
  177  df -i 
  178  df -t ext4
  179  df -h 
  180  cd /var/log/
  181  ls 
  182  yes > file.log \
  183  ls -l 
  184  df -h 
  185  cd /
  186  ls -lh 
  187  du 
  188  du -s
  189  du -sh
```
```bash
# LVM provide solution to raid(redundant array of inexpensive disk) hdd s to each other.
# mean connect hards to each other and 
# raid mirror =raid 1 : means copy one hdd to another. for example : 1tB+1tb = 1tb
# raid zero = 1tb+1tb = 2tb. no lost of data but high risk
# raid 5 = it xor a data with 3 hdd. hdd1 and hdd2 then xor and put data in hdd 3 .2/3 
# there is a specific hardware that it names is raid controller and its duty is balance them.
# after puting the raid controller, ILO should be setup and support to configure the raid.
# LVM has 3 concepts
# PV VG LV
# PV : physical volume
# LV : logical volume
# VG : volume group

# steps for making LVM
# 1) add hard drives 2)partitions  3)physical volumes
# 4) volume group 5)logical volumes  6) file systems
$apt install lvm2

# this procedure is related to the making lvm partitions 

# HAL : Hardware abstraction layer .
# the best tool/hardware is recognized by experience.
#  1)  for lVM, first option is having differnet partitions on different hards
#make a partition
$fdisk /dev/sdb
# n # new partition
# p # primary
#  1 partition
# P print
# type of partition is linux, need to change it
# t # for changing the type
# L # list of type
# 8e #linux lvm
# p print
# w write


$lsblk 

# 2) for LVM, second step is making physical volume 
# make physical volume
$ pvdisplay # show all physical volume
$pvs
 
#  make physical volume
$pvcreate /dev/sdb1  /dev/sdc1
$pvcreate /dev/sda1 
# remove physical volume
$pvremove /dev/sdc1

# 3) for LVM, third step is making  volume group
$vgs # query volume groups
$vgdisplay 
$vgcreate myvg1 /dev/sdb1  /dev/sdc1 
$myvgs
$vgremove myvg1 

# 4) making logical volume is 4th step of LVM 
$lvcreate --name my-lv1 --size 120G myvg1
$lvs

# 5) add file system
$mkfs.ext4 /dev/myvg1/my-lv1


$mkdir /mnt/lvmdir
$mount /dev/myvg1/my-lv1  /mnt/lvmdir

# now you can see the status
$df -h 


# to remove please follow the below
$lvremove /dev/myvg1/my-lv1
$umount /mnt/lvmdir
$lsblk
$lvremove /dev/myvg1/my-lv1

# for extending the LV
$lvextend -L30G /dev/myvg1/lv2 


#  reduce data in LV
$lvreduce -L20G /dev/myvg1/lv2
$lv +tab

# this procedure is related to the making lvm hdd 

root@srv1:~# pvcreate /dev/sdb
ramin@srv1:~$ sudo su -
root@srv1:~# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                    8:0    0  100G  0 disk
├─sda1                 8:1    0    1M  0 part
├─sda2                 8:2    0    2G  0 part /boot
└─sda3                 8:3    0   98G  0 part
  └─ubuntu--vg-lv--0 252:0    0   98G  0 lvm  /
sdb                    8:16   0   25G  0 disk
sr0                   11:0    1 1024M  0 rom
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~# pvcreate /dev/sdb
  Physical volume "/dev/sdb" successfully created.
root@srv1:~#
root@srv1:~#
root@srv1:~# pvs
  PV         VG        Fmt  Attr PSize   PFree
  /dev/sda3  ubuntu-vg lvm2 a--  <98.00g     0
  /dev/sdb             lvm2 ---   25.00g 25.00g
root@srv1:~# vgcreate vg2 /dev/sdb
  Volume group "vg2" successfully created
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~# vgs
  VG        #PV #LV #SN Attr   VSize   VFree
  ubuntu-vg   1   1   0 wz--n- <98.00g      0
  vg2         1   0   0 wz--n- <25.00g <25.00g
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~# lvcreate --name lv5 --size 14G vg2
  Logical volume "lv5" created.
root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~# lvs
  LV   VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv-0 ubuntu-vg -wi-ao---- <98.00g                                                
  lv5  vg2       -wi-a-----  14.00g                                                
root@srv1:~#
root@srv1:~#
root@srv1:~# mkfs.ext4 /dev/vg2/lv5
mke2fs 1.47.0 (5-Feb-2023)
Creating filesystem with 3670016 4k blocks and 917504 inodes
Filesystem UUID: cb797294-a381-423e-b4a6-e1ca680b9724
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done

root@srv1:~#
root@srv1:~#
root@srv1:~# mkfs.ext4 /dev/vg2/lv5  /mnt
mke2fs 1.47.0 (5-Feb-2023)
mkfs.ext4: invalid blocks '/mnt' on device '/dev/vg2/lv5'
root@srv1:~# mount /dev/vg2/lv5  /mnt/
root@srv1:~#
root@srv1:~#
root@srv1:~# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                    8:0    0  100G  0 disk
├─sda1                 8:1    0    1M  0 part
├─sda2                 8:2    0    2G  0 part /boot
└─sda3                 8:3    0   98G  0 part
  └─ubuntu--vg-lv--0 252:0    0   98G  0 lvm  /
sdb                    8:16   0   25G  0 disk
└─vg2-lv5            252:1    0   14G  0 lvm  /mnt
sr0                   11:0    1 1024M  0 rom
root@srv1:~# ls /dev/disk/by-UUID
ls: cannot access '/dev/disk/by-UUID': No such file or directory
root@srv1:~# ls /dev/disk/by-uuid
232348da-12cb-4ee4-950c-2d70adef7235  cb797294-a381-423e-b4a6-e1ca680b9724
8e3a3f21-80d4-4140-a978-40f38c975ab3
root@srv1:~# ls -l /dev/disk/by-uuid
total 0
lrwxrwxrwx 1 root root 10 Nov 15 18:00 232348da-12cb-4ee4-950c-2d70adef7235 -> ../../sda2
lrwxrwxrwx 1 root root 10 Nov 15 18:00 8e3a3f21-80d4-4140-a978-40f38c975ab3 -> ../../dm-0
lrwxrwxrwx 1 root root 10 Nov 15 18:04 cb797294-a381-423e-b4a6-e1ca680b9724 -> ../../dm-1
root@srv1:~#

# what is the LVM snapshot?

root@srv1:~# LVM snapshot   

# one storage for all servers
# helps to have same directory on different servers
# shared storage -NFS(network file system) storage
# ceph storage
# gluster 


# make 2 clones, change the host name of one clone
root@srv1:~# hostnamectl set-hostname client1
root@srv1:~# vim /etc/hosts
root@srv1:~# root@srv1:~# cat /etc/hosts
127.0.0.1 localhost
127.0.1.1 client1

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

# install applications related to the nfs
# on the client side
root@srv1:~# apt update
root@srv1:~# apt install nfs-kernel-server nfs-common
# making the direcotry that we want to mount
root@srv1:~# mkdir /mnt/nfs
root@srv1:~# chown nobody:nogroup /mnt/nfs
root@srv1:~# chmod 777 /mnt/nfs
root@srv1:~# vim /etc/exports 
# /etc/exports: the access control list for filesystems which may be exported                                                               #               to NFS clients.  See exports(5).                      #
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#


# add below 2 lines to exports (one new line and one null)
root@srv1:/etc# cat /etc/exports
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/mnt/nfs 192.168.1.11/24(rw,sync,no_subtree_check)

#restart the nfs , it faces an error while running the root@srv1:/etc# exportfs -r and root@srv1:/etc# exportfs -a    
root@srv1:/etc# systemctl restart nfs-kernel-server
root@srv1:/etc#
root@srv1:/etc#
root@srv1:/etc#
root@srv1:/etc# systemctl restart nfs-server.service
root@srv1:/etc#
root@srv1:/etc#
root@srv1:/etc#
root@srv1:/etc# status nfs-server
Command 'status' not found, did you mean:
  command 'statup' from snap statup (0.79.91)
  command 'states' from deb enscript (1.6.5.90-3.1)
  command 'qstatus' from deb gridengine-client (8.1.9+dfsg-11)
  command 'statfs' from deb gocryptfs (2.4.0-1ubuntu0.24.04.1)
See 'snap info <snapname>' for additional versions.
root@srv1:/etc# systemctl status nfs-kernel-server

# on the client side , it is needed to only install nfs common
root@srv1:~# apt install nfs-common
# mount from the server and created folder to the created folder in client
root@client1:/etc# mount  192.168.1.10://mnt/nfs /mnt/nfsclient
root@client1:/etc# df -h
Filesystem                    Size  Used Avail Use% Mounted on
tmpfs                         197M  1.2M  196M   1% /run
/dev/mapper/ubuntu--vg-lv--0   96G  5.1G   86G   6% /
tmpfs                         984M     0  984M   0% /dev/shm
tmpfs                         5.0M     0  5.0M   0% /run/lock
/dev/sda2                     2.0G   95M  1.7G   6% /boot
tmpfs                         197M   12K  197M   1% /run/user/1000
192.168.1.10:/mnt/nfs          96G  5.1G   86G   6% /mnt/nfsclient






# if  the server reebot/restart ,again mounting should be done.
# this solution is organized for file/folder, not for DB. because conflict can occue.


2.32



# status of a file is checked with ls -l
# permission of a file
# there is 3 type of user in linux

# 1 user , 2 group, 3 other
# check the permission: ls -l
# change chmod u/g/o+-wxr  name of the file
# actions 
# 1) read 2)write 3)execute
ramin@srv1:~$ touch file1
ramin@srv1:~$ ls -l
total 0
-rw-rw-r-- 1 ramin ramin 0 Nov 18 16:30 file1
ramin@srv1:~$

# change permission
#execute
ramin@srv1:~$ chmod u+x file1
ramin@srv1:~$ ls -l
total 0
-rwxrw-r-- 1 ramin ramin 0 Nov 18 16:30 file1
#remove file1
ramin@srv1:~$ chmod u-w file1
ramin@srv1:~$ ls -l
total 0
-r-xrw-r-- 1 ramin ramin 0 Nov 18 16:30 file1
ramin@srv1:~$ 
ramin@srv1:~$ vim file1
# permission error
# permission of group and other
ramin@srv1:~$ chmod g+x file1
ramin@srv1:~$ chmod g+w file1
ramin@srv1:~$ chmod g+r file1
ramin@srv1:~$ ls -l
total 0
-r-xrwxr-- 1 ramin ramin 0 Nov 18 16:30 file1
ramin@srv1:~$ cdmod o+rwx file1
Command 'cdmod' not found, did you mean:
  command 'chmod' from deb coreutils (9.4-2ubuntu2)
Try: sudo apt install <deb name>
ramin@srv1:~$ chmod o+rwx file1
ramin@srv1:~$ ls -l
total 0
-r-xrwxrwx 1 ramin ramin 0 Nov 18 16:30 file1
ramin@srv1:~$

ramin@srv1:~$ ls -l
total 0
-r-xrwxrwx 1 ramin ramin 0 Nov 18 16:30 file1
ramin@srv1:~$ chmod u-rw,g+rwx,o-rwx file1
ramin@srv1:~$ ls -l
total 0
---xrwx--- 1 ramin ramin 0 Nov 18 16:30 file1
root@srv1:~# chmod o+xw,g+wx file1.txt
root@srv1:~#
root@srv1:~# ls -l
total 276
-rw-rwxrwx 1 root root      0 Nov 18 19:10 file1.txt
-rw-r--r-- 1 root root 273365 Nov 10 18:28 mariadb_repo_setup
-rw-r--r-- 1 root root   5824 Jun  3 05:57 zabbix-release_7.0-1+ubuntu24.04_all.deb
root@srv1:~# ls
root@srv1:~# chmod a=rw file1.txt
root@srv1:~# ls -l
total 276
-rw-rw-rw- 1 root root      0 Nov 18 19:10 file1.txt

showing the priority based on values for each read write execute
root@srv1:~# # ---r ---w ---x
root@srv1:~# # 421 421 421
root@srv1:~# chmod 751 file1.txt
root@srv1:~# ls -l
-rwxr-x--x 1 root root      0 Nov 18 19:10 file1.txt
# chmod on directory
root@srv1:~# mkdir /root/pwd
root@srv1:~# ls -l
-rw-r--r-- 1 root root      0 Nov 18 19:42 file1
# directory change the permission# result starts with d
root@srv1:~# chmod 777 pwd
drwxrwxrwx 2 root root   4096 Nov 18 19:44 pwd
root@srv1:~/pwd# touch file1{1..5}.txt
# recursive on files inside the directory
root@srv1:~# chmod -R 777 pwd
root@srv1:~# ls -l pwd
total 0
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file11.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file12.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file13.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file14.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file15.txt
root@srv1:~# ls -l pwd/
total 0
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file11.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file12.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file13.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file14.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 file15.txt
root@srv1:~# ls -l pwd/*
-rwxrwxrwx 1 root root 0 Nov 18 19:44 pwd/file11.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 pwd/file12.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 pwd/file13.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 pwd/file14.txt
-rwxrwxrwx 1 root root 0 Nov 18 19:44 pwd/file15.txt

$which passwd
# -rws  # s means that this command is available for only owner of the file
SUID === GUID ===sticky bit
4777= SUID
2777ramin= SUID on  group 
1777
$ ls -l /usr/bin/ 
# this location of linux commands
root@srv1:~# ls /bin
'['                                   lcf                                scandeps
 aa-enabled                           ldd                                scp
 aa-exec                              ld.so                              screen
 aa-features-abi                      less                               screendump
 ab                                   lessecho                           script
 acpidbg                              lessfile                           scriptlive
 add-apt-repository                   lesskey                            scriptreplay
 addpart                              lesspipe                           scsi_logging_level
 apport-bug                           lexgrog                            scsi_mandat
 apport-cli                           libnetcfg                          scsi_readcap
 apport-collect                       link                               scsi_ready
 apport-unpack                        linux32                            scsi_satl
 appstreamcli                         linux64                            scsi_start
 apropos                              linux-boot-prober                  scsi_stop
 apt                                  linux-check-removal                scsi_temperature
 apt-add-repository                   linux-update-symlinks              sdiff
 apt-cache                            linux-version                      sed
 apt-cdrom                            ln                                 select-editor
 apt-config                           lnstat                             sensible-browser
 apt-extracttemplates                 loadkeys                           sensible-editor
 apt-ftparchive                       loadunimap                         sensible-pager
 apt-get                              locale                             sensible-terminal
 apt-key                              locale-check                       seq
 apt-mark                             localectl                          setarch
 apt-sortpkgs                         localedef                          setfont
 arch                                 logger                             setkeycodes
 aria_chk                             login                              setleds
 aria_dump_log                        loginctl                           setlogcons
 aria_ftdump                          logname                            setmetamode
 aria_pack                            logresolve                         setpci
 aria_read_log                        look                               setpriv
 automat-visualize3                   lowntfs-3g                         setsid
 awk                                  ls                                 setterm
 b2sum                                lsattr                             setupcon
 base32                               lsblk                              sftp
 base64                               lsb_release                        sg
 basename                             lscpu                              sg_bg_ctl
 basenc                               lshw                               sg_compare_and_write
 bash                                 lsinitramfs                        sg_copy_results
 bashbug                              lsipc                              sg_dd
 bc                                   lslocks                            sg_decode_sense
 boltctl                              lslogins                           sg_emc_trespass
 bpftrace                             lsmem                              sg_format
 bpftrace-aotrt                       lsmod                              sg_get_config
 btrfs                                lsns                               sg_get_elem_status
 btrfsck                              lsof                               sg_get_lba_status
 btrfs-convert                        lspci                              sg_ident
 btrfs-find-root                      lspgpot                            sginfo
 btrfs-image                          lspower                            sg_inq
 btrfs-map-logical                    lsusb                              sg_logs
 btrfs-select-super                   lzcat                              sg_luns
 btrfstune                            lzcmp                              sg_map
 busctl                               lzdiff                             sg_map26
 busybox                              lzegrep                            sgm_dd
 byobu                                lzfgrep                            sg_modes
 byobu-config                         lzgrep                             sg_opcodes
 byobu-ctrl-a                         lzless                             sgp_dd
 byobu-disable                        lzma                               sg_persist
 byobu-disable-prompt                 lzmainfo                           sg_prevent
 byobu-enable                         lzmore                             sg_raw
 byobu-enable-prompt                  mailmail3                          sg_rbuf
 byobu-export                         man                                sg_rdac
 byobu-janitor                        mandb                              sg_read
 byobu-keybindings                    manifest                           sg_read_attr
 byobu-launch                         manpath                            sg_read_block_limits
 byobu-launcher                       man-recode                         sg_read_buffer
 byobu-launcher-install               mapscrn                            sg_readcap
 byobu-launcher-uninstall             mariadb                            sg_read_long
 byobu-layout                         mariadb-access                     sg_reassign
 byobu-prompt                         mariadb-admin                      sg_referrals
 byobu-quiet                          mariadb-analyze                    sg_rep_pip
 byobu-reconnect-sockets              mariadb-binlog                     sg_rep_zones
 byobu-screen                         mariadb-check                      sg_requests
 byobu-select-backend                 mariadbcheck                       sg_reset
 byobu-select-profile                 mariadb-conv                       sg_reset_wp
 byobu-select-session                 mariadb-convert-table-format       sg_rmsn
 byobu-shell                          mariadbd-multi                     sg_rtpg
 byobu-silent                         mariadbd-safe                      sg_safte
 byobu-status                         mariadbd-safe-helper               sg_sanitize
 byobu-status-detail                  mariadb-dump                       sg_sat_identify
 byobu-tmux                           mariadb-dumpslow                   sg_sat_phy_event
 byobu-ugraph                         mariadb-find-rows                  sg_sat_read_gplog
 byobu-ulevel                         mariadb-fix-extensions             sg_sat_set_features
 captoinfo                            mariadb-hotcopy                    sg_scan
 cat                                  mariadb-import                     sg_seek
 catman                               mariadb-install-db                 sg_senddiag
 cftp3                                mariadb-optimize                   sg_ses
 cgi-fcgi                             mariadb-plugin                     sg_ses_microcode
 chage                                mariadb-repair                     sg_start
 chardet                              mariadb-report                     sg_stpg
 chardetect                           mariadb-secure-installation        sg_stream_ctl
 chattr                               mariadb-service-convert            sg_sync
 chcon                                mariadb-setpermission              sg_test_rwbuf
 checkgid                             mariadb-show                       sg_timestamp
 chfn                                 mariadb-slap                       sg_turs
 chgrp                                mariadb-tzinfo-to-sql              sg_unmap
 chmod                                mariadb-upgrade                    sg_verify
 choom                                mariadb-waitpid                    sg_vpd
 chown                                markdown-it                        sg_write_buffer
 chrt                                 mawk                               sg_write_long
 chsh                                 mbimcli                            sg_write_same
 chvt                                 mbim-network                       sg_write_verify
 cifsiostat                           mcookie                            sg_write_x
 ckbcomp                              md5sum                             sg_wr_mode
 ckeygen3                             md5sum.textutils                   sg_xcopy
 cksum                                mdig                               sg_zone
 clear                                memhog                             sh
 clear_console                        memusage                           sha1sum
 cloud-id                             memusagestat                       sha224sum
 cloud-init                           mesg                               sha256sum
 cloud-init-per                       migratepages                       sha384sum
 cmp                                  migrate-pubring-from-classic-gpg   sha512sum
 codepage                             migspeed                           shasum
 col                                  mkdir                              showconsolefont
 col1                                 mkfifo                             showkey
 col2                                 mk_modmap                          shred
 col3                                 mknod                              shuf
 col4                                 mksquashfs                         skill
 col5                                 mktemp                             slabtop
 col6                                 mmcli                              sleep
 col7                                 more                               slogin
 col8                                 mount                              snap
 col9                                 mountpoint                         snapctl
 colcrt                               mpstat                             snapfuse
 colrm                                msql2mysql                         snice
 column                               mt                                 socat
 comm                                 mt-gnu                             socat1
 conch3                               mtr                                socat-broker.sh
 corelist                             mtrace                             socat-chain.sh
 cp                                   mtr-packet                         socat-mux.sh
 cpan                                 mv                                 soelim
 cpan5.38-x86_64-linux-gnu            myisamchk                          sort
 cpio                                 myisam_ftdump                      sos
 cpupower                             myisamlog                          sos-collector
 c_rehash                             myisampack                         sosreport
 crontab                              my_print_defaults                  sotruss
 csplit                               mysql                              splain
 ctail                                mysqlaccess                        split
 ctstat                               mysqladmin                         splitfont
 curl                                 mysqlanalyze                       sprof
 cut                                  mysqlbinlog                        sqfscat
 cvtsudoers                           mysqlcheck                         sqfstar
 dash                                 mysql_convert_table_format         ss
 date                                 mysqld_multi                       ssh
 dbilogstrip                          mysqld_safe                        ssh-add
 dbiprof                              mysqld_safe_helper                 ssh-agent
 dbiproxy                             mysqldump                          ssh-argv0
 dbus-cleanup-sockets                 mysqldumpslow                      ssh-copy-id
 dbus-daemon                          mysql_find_rows                    ssh-import-id
 dbus-monitor                         mysql_fix_extensions               ssh-import-id-gh
 dbus-run-session                     mysqlhotcopy                       ssh-import-id-lp
 dbus-send                            mysqlimport                        ssh-keygen
 dbus-update-activation-environment   mysql_install_db                   ssh-keyscan
 dbus-uuidgen                         mysqloptimize                      stat
 dbxtool                              mysql_plugin                       static-sh
 dd                                   mysqlrepair                        stdbuf
 deallocvt                            mysqlreport                        strace
 debconf                              mysql_secure_installation          strace-log-merge
 debconf-apt-progress                 mysql_setpermission                streamzip
 debconf-communicate                  mysqlshow                          stty
 debconf-copydb                       mysqlslap                          su
 debconf-escape                       mysql_tzinfo_to_sql                sudo
 debconf-set-selections               mysql_upgrade                      sudoedit
 debconf-show                         mysql_waitpid                      sudoreplay
 debian-distro-info                   mytop                              sum
 deb-systemd-helper                   namei                              sync
 deb-systemd-invoke                   nano                               systemctl
 delpart                              nawk                               systemd
 delv                                 nc                                 systemd-ac-power
 df                                   nc.openbsd                         systemd-analyze
 dh_bash-completion                   neqn                               systemd-ask-password
 dh_installxmlcatalogs                netaddr                            systemd-cat
 dh_perl_dbi                          netcat                             systemd-cgls
 diff                                 net-snmp-create-v3-user            systemd-cgtop
 diff3                                networkctl                         systemd-confext
 dig                                  networkd-dispatcher                systemd-creds
 dir                                  newgrp                             systemd-cryptenroll
 dircolors                            NF                                 systemd-cryptsetup
 dirmngr                              ngettext                           systemd-delta
 dirmngr-client                       nice                               systemd-detect-virt
 dirname                              nisdomainname                      systemd-escape
 distro-info                          nl                                 systemd-firstboot
 dmesg                                nohup                              systemd-hwdb
 dnsdomainname                        nproc                              systemd-id128
 domainname                           nroff                              systemd-inhibit
 do-release-upgrade                   nsenter                            systemd-machine-id-setup
 dpkg                                 nslookup                           systemd-mount
 dpkg-deb                             nstat                              systemd-notify
 dpkg-divert                          nsupdate                           systemd-path
 dpkg-maintscript-helper              ntfs-3g                            systemd-repart
 dpkg-query                           ntfs-3g.probe                      systemd-run
 dpkg-realpath                        ntfscat                            systemd-socket-activate
 dpkg-split                           ntfscluster                        systemd-stdio-bridge
 dpkg-statoverride                    ntfscmp                            systemd-sysext
 dpkg-trigger                         ntfsdecrypt                        systemd-sysusers
 du                                   ntfsfallocate                      systemd-tmpfiles
 dumpkeys                             ntfsfix                            systemd-tty-ask-password-agent
 eatmydata                            ntfsinfo                           systemd-umount
 ec2metadata                          ntfsls                             tabs
 echo                                 ntfsmove                           tac
 ed                                   ntfsrecover                        tail
 editor                               ntfssecaudit                       tapestat
 egrep                                ntfstruncate                       tar
 eject                                ntfsusermap                        taskset
 enc2xs                               ntfswipe                           tbl
 encguess                             numactl                            tclsh
 env                                  numastat                           tclsh8.6
 envsubst                             numfmt                             tcpdump
 eqn                                  nvidia-detector                    tee
 ex                                   od                                 telnet
 expand                               oem-getlogs                        tempfile
 expiry                               on_ac_power                        test
 expr                                 openssl                            tic
 factor                               openvt                             time
 faillog                              os-prober                          timedatectl
 fallocate                            pager                              timeout
 false                                partx                              tkconch3
 fcgistarter                          passwd                             tload
 fgconsole                            paste                              tmux
 fgrep                                pastebinit                         tnftp
 filan                                patch                              toe
 file                                 pathchk                            top
 finalrd                              pbget                              touch
 find                                 pbput                              tput
 findmnt                              pbputs                             tr
 flock                                pdb3                               trace-cmd
 fmt                                  pdb3.12                            tracepath
 fold                                 peekfd                             trial3
 fping                                perf                               troff
 fping6                               perl                               true
 free                                 perl5.38.2                         truncate
 ftp                                  perl5.38-x86_64-linux-gnu          tset
 fuser                                perlbug                            tsort
 fusermount                           perldoc                            tty
 fusermount3                          perlivp                            turbostat
 fwupdmgr                             perlthanks                         twist3
 fwupdtool                            perror                             twistd3
 galera_new_cluster                   pgrep                              tzselect
 galera_recovery                      phar                               ua
 gapplication                         phar8.3                            ubuntu-advantage
 gawk                                 phar8.3.phar                       ubuntu-bug
 gawkbug                              phar.phar                          ubuntu-core-launcher
 gdbus                                phar.phar8.3                       ubuntu-distro-info
 gencat                               php                                ubuntu-drivers
 geqn                                 php8.3                             ubuntu-security-status
 getconf                              pic                                ucf
 getent                               pico                               ucfq
 getkeycodes                          piconv                             ucfr
 getopt                               pidof                              uclampset
 gettext                              pidstat                            udevadm
 gettext.sh                           pidwait                            udisksctl
 ginstall-info                        pinentry                           ul
 gio                                  pinentry-curses                    umount
 gio-querymodules                     ping                               uname
 git                                  ping4                              unattended-upgrade
 git-receive-pack                     ping6                              unattended-upgrades
 git-shell                            pinky                              uncompress
 git-upload-archive                   pkaction                           unexpand
 git-upload-pack                      pkcheck                            unicode_start
 glib-compile-schemas                 pkcon                              unicode_stop
 gpasswd                              pkill                              uniq
 gpg                                  pkmon                              unlink
 gpg-agent                            pkttyagent                         unlzma
 gpgconf                              pl2pm                              unminimize
 gpg-connect-agent                    pldd                               unmkinitramfs
 gpgparsemail                         plymouth                           unshare
 gpgsm                                pmap                               unsquashfs
 gpgsplit                             pod2html                           unxz
 gpgtar                               pod2man                            unzstd
 gpgv                                 pod2text                           update-alternatives
 gpg-wks-client                       pod2usage                          update-mime-database
 gpic                                 podchecker                         upower
 gpu-manager                          pollinate                          uptime
 grep                                 pr                                 usb-devices
 gresource                            preconv                            usbhid-dump
 groff                                printenv                           usbip
 grog                                 printf                             usbipd
 grops                                prlimit                            usbreset
 grotty                               pro                                users
 groups                               procan                             utmpdump
 growpart                             prove                              uuidgen
 grub-editenv                         prtstat                            uuidparse
 grub-file                            ps                                 varlinkctl
 grub-fstest                          psfaddtable                        vcs-run
 grub-glue-efi                        psfgettable                        vdir
 grub-kbdcomp                         psfstriptable                      VGAuthService
 grub-menulst2cfg                     psfxtable                          vi
 grub-mkfont                          pslog                              view
 grub-mkimage                         pstree                             vigpg
 grub-mklayout                        pstree.x11                         vim
 grub-mknetdir                        ptar                               vim.basic
 grub-mkpasswd-pbkdf2                 ptardiff                           vimdiff
 grub-mkrelpath                       ptargrep                           vim.tiny
 grub-mkrescue                        ptx                                vimtutor
 grub-mkstandalone                    purge-old-kernels                  vmhgfs-fuse
 grub-mount                           pv                                 vmstat
 grub-ntldr-img                       pwd                                vm-support
 grub-render-label                    pwdx                               vmtoolsd
 grub-script-check                    py3clean                           vmware-alias-import
 grub-syslinux2cfg                    py3compile                         vmware-checkvm
 gsettings                            py3versions                        vmware-hgfsclient
 gtbl                                 pybabel                            vmware-namespace-cmd
 gunzip                               pybabel-python3                    vmware-rpctool
 gzexe                                pydoc3                             vmware-toolbox-cmd
 gzip                                 pydoc3.12                          vmware-vgauth-cmd
 h2ph                                 pygettext3                         vmware-vmblock-fuse
 h2xs                                 pygettext3.12                      vmware-xferlogs
 hardlink                             pygmentize                         w
 hd                                   pyhtmlizer3                        wall
 head                                 pyserial-miniterm                  watch
 helpztags                            pyserial-ports                     watchgnupg
 hexdump                              python3                            wc
 host                                 python3.12                         wdctl
 hostid                               pzstd                              wget
 hostname                             qmicli                             whatis
 hostnamectl                          qmi-firmware-update                whereis
 htcacheclean                         qmi-network                        which
 htdbm                                quirks-handler                     which.debianutils
 htdigest                             rbash                              whiptail
 htop                                 rdma                               who
 htpasswd                             readlink                           whoami
 hwe-support-status                   realpath                           wifi-status
 i386                                 red                                write
 iconv                                rename.ul                          wsrep_sst_backup
 id                                   renice                             wsrep_sst_common
 inetutils-telnet                     replace                            wsrep_sst_mariabackup
 info                                 rescan-scsi-bus.sh                 wsrep_sst_mysqldump
 infobrowser                          reset                              wsrep_sst_rsync
 infocmp                              resizecons                         wsrep_sst_rsync_wan
 infotocap                            resizepart                         x86_64
 innochecksum                         resolvectl                         x86_energy_perf_policy
 innotop                              resolveip                          xargs
 install                              resolve_stack_dump                 xauth
 install-info                         rev                                xdg-user-dir
 instmodsh                            rgrep                              xdg-user-dirs-update
 ionice                               rm                                 xsubpp
 iostat                               rmdir                              xxd
 ip                                   rnano                              xz
 ipcmk                                rotatelogs                         xzcat
 ipcrm                                routel                             xzcmp
 ipcs                                 rpcgen                             xzdiff
 iptables-xml                         rrsync                             xzegrep
 ischroot                             rsync                              xzfgrep
 iscsiadm                             rsync-ssl                          xzgrep
 join                                 rtla                               xzless
 journalctl                           rtstat                             xzmore
 jq                                   runcon                             yes
 jsondiff                             run-one                            ypdomainname
 jsonpatch                            run-one-constantly                 zcat
 json-patch-jsondiff                  run-one-until-failure              zcmp
 jsonpointer                          run-one-until-success              zdiff
 json_pp                              run-parts                          zdump
 jsonschema                           run-this-one                       zegrep
 kbdinfo                              rview                              zfgrep
 kbd_mode                             rvim                               zforce
 kbxutil                              sadf                               zgrep
 keep-one-running                     sar                                zipdetails
 kernel-install                       sar.sysstat                        zless
 kill                                 savelog                            zmore
 killall                              sbattach                           znew
 kmod                                 sbkeysync                          zstd
 kmodsign                             sbsiglist                          zstdcat
 landscape-sysinfo                    sbsign                             zstdgrep
 last                                 sbvarsign                          zstdless
 lastb                                sbverify                           zstdmt
 lastlog                              scalar
root@srv1:~#


root@srv1:~# chown root: file2
root@srv1:~# ls -l
total 284
-rw-r--r-- 1 root root      0 Nov 19 16:37 file1
-rwxr-x--x 1 root root      0 Nov 18 19:10 file1.txt
drwxr-xr-x 2 root root   4096 Nov 19 16:38 file2
-rw-r--r-- 1 root root 273365 Nov 10 18:28 mariadb_repo_setup
drwxrwxrwx 2 root root   4096 Nov 18 19:44 pwd
-rw-r--r-- 1 root root   5824 Jun  3 05:57 zabbix-release_7.0-1+ubuntu24.04_all.deb
root@srv1:~# chgrp root file2



root@srv1:~# ls -l /\
>
total 2097268
lrwxrwxrwx   1 root root          7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root       4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   4 root root       4096 Oct 22 15:04 boot
dr-xr-xr-x   2 root root       4096 Aug 27 15:39 cdrom
drwxr-xr-x  21 root root       4180 Nov 19 16:26 dev
drwxr-xr-x 113 root root       4096 Nov 10 18:30 etc
drwxr-xr-x   3 root root       4096 Oct 22 15:11 home
lrwxrwxrwx   1 root root          7 Apr 22  2024 lib -> usr/lib
lrwxrwxrwx   1 root root          9 Apr 22  2024 lib64 -> usr/lib64
drwxr-xr-x   2 root root       4096 Feb 26  2024 lib.usr-is-merged
drwx------   2 root root      16384 Oct 22 14:57 lost+found
drwxr-xr-x   2 root root       4096 Aug 27 14:18 media
drwxr-xr-x   2 root root       4096 Aug 27 14:18 mnt
drwxr-xr-x   2 root root       4096 Aug 27 14:18 opt
dr-xr-xr-x 209 root root          0 Nov 19 16:25 proc
drwx------   6 root root      36864 Nov 19 16:38 root
drwxr-xr-x  31 root root        900 Nov 19 16:28 run
lrwxrwxrwx   1 root root          8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root       4096 Apr  3  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root       4096 Oct 22 15:11 snap
drwxr-xr-x   2 root root       4096 Aug 27 14:18 srv
-rw-------   1 root root 2147483648 Oct 22 15:03 swap.img
dr-xr-xr-x  13 root root          0 Nov 19 16:25 sys
drwxrwxrwt  13 root root       4096 Nov 19 16:39 tmp
drwxr-xr-x  12 root root       4096 Aug 27 14:18 usr
drwxr-xr-x  15 root root       4096 Nov 10 18:25 var


# soft link and hard link( shortcut)
# hard link = inode number is same, only file can be linked, only in one partition could be done
# soft link =inode number is different, file and directory both could be linked


root@srv1:~# touch file3
root@srv1:~# ln file3 hardfile
root@srv1:~# ls
file1      file2  hardfile            pwd
file1.txt  file3  mariadb_repo_setup  zabbix-release_7.0-1+ubuntu24.04_all.deb
root@srv1:~# nano file 3
root@srv1:~# cat file
salam
root@srv1:~# cat hardfile
root@srv1:~# cat file3
root@srv1:~# ln file hardfile
ln: failed to create hard link 'hardfile': File exists
root@srv1:~# nano file3
root@srv1:~# root@srv1:~#
root@srv1:~#
root@srv1:~#
root@srv1:~# cat file3
salam

root@srv1:~# cat hardfile
salam

# soft link
root@srv1:~# ln -s file3 softlinkfile
root@srv1:~# cat softlinkfile
salam
#how to un link
root@srv1:~# unlink softlinkfile
root@srv1:~# ls -l
total 296
-rw-r--r-- 1 root root      6 Nov 19 16:46 file
-rw-r--r-- 1 root root      0 Nov 19 16:37 file1
-rwxr-x--x 1 root root      0 Nov 18 19:10 file1.txt
drwxr-xr-x 2 root root   4096 Nov 19 16:38 file2
-rw-r--r-- 2 root root      7 Nov 19 16:48 file3
-rw-r--r-- 2 root root      7 Nov 19 16:48 hardfile
-rw-r--r-- 1 root root 273365 Nov 10 18:28 mariadb_repo_setup
drwxrwxrwx 2 root root   4096 Nov 18 19:44 pwd
-rw-r--r-- 1 root root   5824 Jun  3 05:57 zabbix-release_7.0-1+ubuntu24.04_all.deb
root@srv1:~# cat softlinkfile



# crontab 
root@srv1:~# vim /etc/crontab
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'                                                                                                          # command to install the new version when you edit this file                                                                                                            # and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
# You can also override PATH, but by default, newer versions inherit it from the environment
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }
#                                                                                                                                                                       *  *     * * *   root   ping -c 2 8.8.8.8 >> /var/log/ping.log
                                                                                                                                                                        *  *     * * *   root   ping -c 2 8.8.8.8 >> /var/log/ping.log

# Cron helps to schedule the task
#  1min - 1year
# in server linux:  cron   ---- in desktop linux : anacron
# every user could define its own cron and it culminated problems.maybe mistakenly crons by user
#    *  *      *        *       *  
#  min hour dayofmonth month dayofweek


root@srv1:~# crontab -e
no crontab for root - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
  4. /bin/ed

Choose 1-4 [1]: 2
crontab: installing new crontab

root@srv1:~# cronab -l
Command 'cronab' not found, did you mean:
  command 'crontab' from deb cron (3.0pl1-178ubuntu1)
  command 'crontab' from deb bcron (0.11-21)
  command 'crontab' from deb cronie (1.7.0-2)
  command 'crontab' from deb systemd-cron (2.3.0-2)
Try: apt install <deb name>

# $ check the crontab
root@srv1:~# crontab -l
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
20 18 19 11 * ping 8.8.8.8




# /etc/crontab: system-wide crontab                                                                     # Unlike any other crontab you don't have to run the `crontab'                                          # command to install the new version when you edit this file                                            # and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
# You can also override PATH, but by default, newer versions inherit it from the environment
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }
#
~     

# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'                                          # command to install the new version when you edit this file                                            # and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
# You can also override PATH, but by default, newer versions inherit it from the environment
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }
#
*/2 * * * * root ping -c 2 8.8.8.8  >> /var/log/ping.log
*/1 * * * * root echo "################ CRON LOG##" >> /var/log/ping.log
30 1 * * * root mysqldump >> /root/all.sql
17-23 * * * * root ping -c 2 8.8.8.8  >> /var/log/ping.log
@reboot  root command # cron run after reboot
@weekly
@montly
@daily
@hourly

~                                                                                                       ~                                                                                                       ~                                                                                                       ~         

root@srv1:~# root@srv1:~# vim /etc/crontab
root@srv1:~# vim /etc/crontab
root@srv1:~# root@srv1:~#
root@srv1:~# cat /var
cat: /var: Is a directory
root@srv1:~# cat /var/log
cat: /var/log: Is a directory
root@srv1:~# cat /var/log/
alternatives.log       cloud-init.log         faillog                README
alternatives.log.1     cloud-init-output.log  installer/             syslog
apache2/               dist-upgrade/          journal/               syslog.1
apport.log             dmesg                  kern.log               syslog.2.gz
apt/                   dmesg.0                kern.log.1             sysstat/
auth.log               dmesg.1.gz             kern.log.2.gz          unattended-upgrades/
auth.log.1             dmesg.2.gz             landscape/             wtmp
auth.log.2.gz          dmesg.3.gz             lastlog                zabbix/
bootstrap.log          dmesg.4.gz             nginx/
btmp                   dpkg.log               ping.log
btmp.1                 dpkg.log.1             private/
root@srv1:~# cat /var/log/ping.log
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=51 time=52.7 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=51 time=54.7 ms

--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1017ms
rtt min/avg/max/mdev = 52.736/53.716/54.697/0.980 ms
root@srv1:~#

#  new crons should be add by below method and put in below directory
root@srv1:/etc/cron.d# 
root@srv1:/etc/cron.d# vim local
root@srv1:/etc/cron.d# cat local
*/2 * * * * root ping -c 2 8.8.8.8  >> /var/log/ping.log
root@srv1:/etc/cron.d# ls
e2scrub_all  local  php  sysstat
root@srv1:/etc/cron.d#


# if we want to change something one time only, we need to use at
root@srv1:/etc/cron.d# at 10:10AM
warning: commands will be executed using /bin/sh
at Thu Nov 21 10:10:00 2024
at> cd /tmp
at> rm -f *
at> <EOT>  # ctrl+d
job 1 at Thu Nov 21 10:10:00 2024
root@srv1:/etc/cron.d#
root@srv1:/etc/cron.d# at teatime
warning: commands will be executed using /bin/sh
at Thu Nov 21 16:00:00 2024
at>
root@srv1:/etc/cron.d# at now + 1 hour
warning: commands will be executed using /bin/sh
at Thu Nov 21 09:07:00 2024
at> ^\Quit (core dumped)

# query the task and know the time of tasks and remove the task
root@srv1:/etc/cron.d# atq
2       Thu Nov 21 16:00:00 2024 a root
1       Thu Nov 21 10:10:00 2024 a root
3       Thu Nov 21 09:07:00 2024 a root
root@srv1:/etc/cron.d# atrm
Usage: at [-V] [-q x] [-f file] [-u username] [-mMlbv] timespec ...
       at [-V] [-q x] [-f file] [-u username] [-mMlbv] -t time
       at -c job ...
       at [-V] -l [-o timeformat] [job ...]
       atq [-V] [-q x] [-o timeformat] [job ...]
       at [ -rd ] job ...
       atrm [-V] job ...
       batch
root@srv1:/etc/cron.d# atrm 2
root@srv1:/etc/cron.d# atq
1       Thu Nov 21 10:10:00 2024 a root
3       Thu Nov 21 09:07:00 2024 a root

# make the cron.allow  permission
root@srv1:/etc/cron.d# touch /etc/cron.allow

ramin
root

root@srv1:/etc/cron.d# vim /etc/cron.deny



```
<!-- scripting  -->
```bash
# scripting

root@srv1:/etc/cron.d# chmod +x script2.sh
root@srv1:/etc/cron.d# ls -l
total 24
drwxr-xr-x 2 root root 4096 Nov 21 09:03 dir1
-rw-r--r-- 1 root root  201 Apr  8  2024 e2scrub_all
-rw-r--r-- 1 root root  712 Jan 19  2024 php
-rwxr-xr-x 1 root root   31 Nov 21 09:12 script2.sh
-rw-r--r-- 1 root root  396 Aug 27 14:26 sysstat
-rw-r--r-- 1 root root   54 Nov 21 09:02 test



#!/bin/bash
root@srv1:/etc/cron.d# vim script2.sh
echo "hello world"

read -p "enter your name:" name
echo "yourname is : $name"

mkdir $name
touch $name/$name.txt
~
root@srv1:~# vim new.sh

root@srv1:~# vim new.sh
#!/bin/bash
# -s -p is hiding the password
read -s -p "enter the password" PASSWORD
read  -p "enter the user name" user_name
echo "your username is" $user_name "and your password is" $PASSWORD

```

```bash
# make 2 server with same ping ips - master slave shared DB
$ sudo apt update
$ sudo apt install mariadb 
$ systemctl mariadb #active
# select the 50-server.cnf
$ vim /etc/hosts
# then shift + g = end of the line
# put the ip db1 and ip db2 in the file
#then ping could be done by ping db1 without ip
$ ss-ntlp # check the which port is working with the mariadb
$ so it seems the mariadb is listening on the first ip while it is not correct. need to change the ip
$ vim  /etc/mysql/mariadb.conf.d/50-server.cnf
# change the bind-address to its own ip
$ systemctl restart mariadb #mariadb is listening on port 3306
$ ss-ntlp # now the ip is changed

how to use git:

root@srv1:/home# mkdir tmp
root@srv1:/home# cd tmp
root@srv1:/home/tmp# nano test.sh
root@srv1:/home/tmp#
root@srv1:/home/tmp#
root@srv1:/home/tmp#
root@srv1:/home/tmp# ls
test.sh
root@srv1:/home/tmp# git init
Initialized empty Git repository in /home/tmp/.git/
root@srv1:/home/tmp# ls -a
.  ..  .git  test.sh
root@srv1:/home/tmp#

install oh my bash:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"


07:36:25 root@srv1 tmp ±|test ✗|→ git status
On branch test

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.sh

nothing added to commit but untracked files present (use "git add" to track)
07:36:40 root@srv1 tmp ±|test ✗|→


07:38:31 root@srv1 tmp ±|test ✗|→ git commit -m "add test file"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'root@srv1.(none)')
07:44:13 root@srv1 tmp ±|test ✗|→ git config --global user.email "milad@gmail.com"
07:45:14 root@srv1 tmp ±|test ✗|→ git config --global user.name "ramin"
07:45:56 root@srv1 tmp ±|test ✗|→ git commit -m "add test file"
[test (root-commit) 19c1cfd] add test file
 1 file changed, 2 insertions(+)
 create mode 100644 test.sh
07:46:10 root@srv1 tmp ±|test|→


overall
git add <file name>
git commit -m <message>

git log

commit d423bd39ac42590b102c5ed1566f01d2eb541e9c (HEAD -> test)
Author: ramin <milad@gmail.com>
Date:   Sat Dec 21 20:13:29 2024 +0000

    update

commit 03f1a98b9ff94479123557173eff338768fd7371
Author: ramin <milad@gmail.com>
Date:   Sat Dec 21 20:10:07 2024 +0000

    update

commit 058746c3d8068bee2002e57a104f2224d0c8ecbd
Author: ramin <milad@gmail.com>
Date:   Sat Dec 21 20:08:40 2024 +0000

    update

commit 19c1cfd0056d697e700a20d73b791b2e4408a162
Author: ramin <milad@gmail.com>
Date:   Sat Dec 21 19:46:10 2024 +0000

    add test file
(END)


new branch:

08:25:23 root@srv1 tmp ±|test|→ git branch dev
08:50:16 root@srv1 tmp ±|test|→ git branch
08:50:44 root@srv1 tmp ±|test|→ git checkout -b dev
fatal: a branch named 'dev' already exists
08:51:23 root@srv1 tmp ±|test|→ git checkout dev
Switched to branch 'dev'

08:52:49 root@srv1 tmp ±|dev|→ nano test.sh
08:53:33 root@srv1 tmp ±|dev ✗|→ cat test.sh

salam hasmsari




gorrbunesh beshame maniiiii


Minayiii

developp

08:53:39 root@srv1 tmp ±|dev ✗|→ git status
On branch dev
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   test.sh

no changes added to commit (use "git add" and/or "git commit -a")
08:53:50 root@srv1 tmp ±|dev ✗|→ git diff
diff       difftool
08:53:50 root@srv1 tmp ±|dev ✗|→ git diff test

[6]+  Stopped                 git diff test
[6]+  Stopped                 git diff test
08:54:18 root@srv1 tmp ±|dev ✗|→ git add test.sh
08:54:35 root@srv1 tmp ±|dev ✗|→ git commit "new comment"
error: pathspec 'new comment' did not match any file(s) known to git
08:54:47 root@srv1 tmp ±|dev ✗|→ git commit-m  "new comment"
git: 'commit-m' is not a git command. See 'git --help'.

The most similar command is
        commit-tree
08:54:53 root@srv1 tmp ±|dev ✗|→ git commit -m  "new comment"
[dev 8474f0f] new comment
 1 file changed, 2 insertions(+)
08:54:57 root@srv1 tmp ±|dev|→ git status
On branch dev
nothing to commit, working tree clean
08:55:03 root@srv1 tmp ±|dev|→ git checkout test
Switched to branch 'test'
08:55:13 root@srv1 tmp ±|test|→ cat test.sh

salam hasmsari




gorrbunesh beshame maniiiii


Minayiii

08:55:42 root@srv1 tmp ±|test|→

delete a branch
05:05:48 root@srv1 tmp ±|test|→ git branch -d test

generate ssh keygen
07:10:33 root@srv1 ~ ±|master ✗|→ cd ~/.ssh
07:10:45 root@srv1 .ssh ±|master ✗|→ ls
authorized_keys  id_ed25519  id_ed25519.pub  known_hosts
07:10:47 root@srv1 .ssh ±|master ✗|→ cd known_hosts
-bash: cd: known_hosts: Not a directory
07:10:56 root@srv1 .ssh ±|master ✗|→ cat id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPR/1IgWQrZ98s9NodY0XQyh5ldt/ZY/8J5DDy5Bc9gd root@srv1
07:11:06 root@srv1 .ssh ±|master ✗|→ ssh-keygen
Generating public/private ed25519 key pair.
Enter file in which to save the key (/root/.ssh/id_ed25519): new
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in new
Your public key has been saved in new.pub
The key fingerprint is:
SHA256:fepp5iCKVfSsfEcce5GY3H7I0nSrAWwqHgRUx8AHYGo root@srv1
The key's randomart image is:
+--[ED25519 256]--+
|   .=+++.        |
|   o ...oo + .   |
|  E   o.  O = .  |
| .   o o = O + . |
|      + S * O o  |
|     + + . = +   |
|    . = o o .    |
|   o . o +o.     |
|  . .    ++      |
+----[SHA256]-----+
07:12:03 root@srv1 .ssh ±|master ✗|→ ls
authorized_keys  id_ed25519  id_ed25519.pub  known_hosts  new  new.pub
07:12:06 root@srv1 .ssh ±|master ✗|→ cat new.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICMv/il1Jphx5UWPTGbr0RXDI36CcMyQr46F+7MnIw/D root@srv1
07:12:16 root@srv1 .ssh ±|master ✗|→




08:09:17 root@srv1 .ssh ±|master ✗|→ cat id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjKNKIk4/2X80N8VVGIfQEK1PgPySsr5lNUsrWrhYEKBkrJbq7PgDU7JxOW5iwGHcamSZXmgoxBO1E5i4BNL3UpebT5QcVCdxEWQFEzCff/qet79CpFLZqPe/PU+zgoQOMO2EIUcxfPKIW64CA7tPWOX5Vac7RFUxBO/ux1PDUClQNkveVr4wYbAkr6RkbtAI7bp8vTa9PWlUgp+z9R/t5HvUbGfv8ZkKTOn4S++SJIiW0CzeRYG+6J4U+nmk7GYP6b5XWjDIWwLQ7l5nLJ+a7OQjFkrvZ1aKna1hyGiLRR/0/GLJeUXBiTYWGz6oTB7rQePwqGa3S4y9GG35IuPzesuDYYk/io7RM4ijI+T24ZGJLqhmMUsKp9F4kWMJC6pYKvbMGeoC2aueLlgBh+kZ532yqnGIfT00OfbKHpeMLOgzTEFoux0M+03Aekp/5neuedoK4k7G2amsjMgDw2trN68dCqTsmF37maPWMchsfZwDG0I9grRDZiZdD0TMHEuichdaAbXkp2GOQMjsFsFlidTIqwVtFNgXm6PBQbyPz7l0Yb22lzOxI1GzwcYZ56Uw3qPrdx0B8dTa2epOOZtI65+iFRY5APWYR27p4phvhJMro63UmYV72WgyijH38mylF5/uKkEGt+O7dJPtuSVeoHgYxAnExKegKcleyMrtevQ== ramin.sabzalizade@gmail.com
08:09:34 root@srv1 .ssh ±|master ✗|→ ls
authorized_keys  devops  id_ed25519  id_ed25519.pub  id_rsa  id_rsa.pub  known_hosts  new  new.pub
08:10:17 root@srv1 .ssh ±|master ✗|→ ls
authorized_keys  devops  id_ed25519  id_ed25519.pub  id_rsa  id_rsa.pub  known_hosts  new  new.pub
08:10:44 root@srv1 .ssh ±|master ✗|→ cd devops/
/root/.ssh/devops
08:10:53 root@srv1 devops ±|main ✗|→ s
bookmark name required
08:10:55 root@srv1 devops ±|main ✗|→ ls
keynewssh  keynewssh.pub  README.md
08:10:56 root@srv1 devops ±|main ✗|→ rm -rf ke
keynewssh      keynewssh.pub
08:10:56 root@srv1 devops ±|main ✗|→ rm -rf keynewssh
08:11:16 root@srv1 devops ±|main ✗|→ ls
keynewssh.pub  README.md
08:11:18 root@srv1 devops ±|main ✗|→ rm -rf keynewssh.pub
08:11:26 root@srv1 devops ±|main|→ ls
README.md
08:11:27 root@srv1 devops ±|main|→ ls
README.md
08:11:29 root@srv1 devops ±|main|→ git push
Username for 'https://github.com': raminsabzalizade
Password for 'https://raminsabzalizade@github.com':
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/RaminSabzalizade/devops.git/'
08:11:52 root@srv1 devops ±|main|→ git push
Username for 'https://github.com':
Password for 'https://github.com':
remote: No anonymous write access.
fatal: Authentication failed for 'https://github.com/RaminSabzalizade/devops.git/'
08:12:00 root@srv1 devops ±|main|→ git remote set-url origin git@github.com:RaminSabzalizade/devops.git
08:13:25 root@srv1 devops ±|main|→ ssh -T git@github.com
Hi RaminSabzalizade! You've successfully authenticated, but GitHub does not provide shell access.
08:13:46 root@srv1 devops ±|main|→ ls
README.md
08:13:51 root@srv1 devops ±|main|→ git push
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 2 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (9/9), 734 bytes | 122.00 KiB/s, done.
Total 9 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:RaminSabzalizade/devops.git
   55c8b27..5e67370  main -> main
08:14:02 root@srv1 devops ±|main|→




```



```bash
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