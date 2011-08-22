#!/bin/sh
#reference:http://www.cyberciti.biz/faq/howto-move-migrate-user-accounts-old-to-new-server/
mkdir /root/newusers.bak
cp /etc/passwd /etc/shadow /etc/group /etc/gshadow /root/newsusers.bak
# cd /path/to/location
# cat passwd.mig >> /etc/passwd
# cat group.mig >> /etc/group
# cat shadow.mig >> /etc/shadow
# cat gshadow.mig >> /etc/gshadow
cd /

tar -zxvf /path/to/location/home.tar.gz
cd /
tar -zxvf /path/to/location/mail.tar.gz
