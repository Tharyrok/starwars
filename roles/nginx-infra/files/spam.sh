#!/bin/bash

dir=$(mktemp -d)
cd ${dir}

wget -q http://www.stopforumspam.com/downloads/listed_ip_180.zip -Olisted_ip_180.zip
unzip -qq listed_ip_180.zip

printf "" > /etc/nginx/conf.d/stopforumspam.conf

while read p; do
	printf "deny ${p};\n" >> /etc/nginx/conf.d/stopforumspam.conf
done < ./listed_ip_180.txt

cd / && rm -rf ${dir}

systemctl restart nginx
