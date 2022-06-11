#!/bin/sh
# WIP: Work in Progress, lots to do here

find / -perm -222 -type d 2>/dev/null # writable directories
find / -perm -4000 -type f 2>/dev/null  # suid 
find / -perm -g=s -type f 2>/dev/null  # guid
find / -perm -o w -type d 2>/dev/null # writable directories
find / -perm -o x -type d 2>/dev/null # world executable folder
find / -perm -u=s -type f 2>/dev/null  # sticky bit
find / -writable ! -user `whoami` -type f ! -path "/proc/*" ! -path "/sys/*" 2>/dev/null  # writable files
find / -writable -type d 2>/dev/null  # writable directories
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null  # world writable and executable folders

grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null  # files containing password
grep -irE '(password|pwd|pass)[[:space:]]*=[[:space:]]*[[:alpha:]]+' *  # password, pwd, pass

iptables -I INPUT  1 -s {{host}} -j ACCEPT
iptables -I OUTPUT 1 -s {{host}} -j ACCEPT
iptables -Z
iptables -vn -L
iptables-save > savedrules.txt

strings /dev/mem -n10 | grep -i PASS  # in memory password

/usr/bin/getcap -r  /usr/bin  # list capabilities of binaries
# apt list
# apt search {{package}}
# apt show {{package}}

# ... base64 encoded enumeration scripts go here
