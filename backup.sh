#!/bin/sh
#http://www.cyberciti.biz/faq/howto-move-migrate-user-accounts-old-to-new-server/
mkdir /root/move

export UGIDLIMIT=500

#Creat user file, filter out all users for id larger than UGID limit
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > /root/move/passwd.mig #migrate users larger than UGIDLMIT

#Create group file, filter out all users for id larger than UGID limit
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > /root/move/group.mig

#Create shadow file corresponding to user account
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /root/move/shadow.mig 

$TODO need to test
#Create gshadow file corresponding to the group accounts
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/group | tee - |egrep -f - /etc/gshadow > /root/move/gshadow.mig


