#!/bin/bash

#
# Guillaume Subiron, Sysnove, 2016
# Inspired by Benjamin Sonntag's https://github.com/octopuce/octopuce-goodies/blob/master/letsencrypt-renew/letsencrypt-auto-renew.sh
#
# Description :
#
# This script generates or regenerates SSL certificates using acme-tiny
# to sign the certificate signing requests found in /etc/letsencrypt/
# For more : look at https://www.sysnove.fr/blog/2016/03/utilisation-pratique-letsencrypt-acme-tiny.html
#
# Copyright 2016 Guillaume Subiron <guillaume@sysnove.fr>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the http://www.wtfpl.net/ file for more details.
#


ADMIN_EMAIL="postmaster@tharyrok.eu.org"
ACME_BIN=/home/letsencrypt/acme_tiny.py
CONFIG_DIR=/home/letsencrypt/ssl
ACCOUNT_KEY=$CONFIG_DIR/letsencrypt.key
INTERMEDIATE=$CONFIG_DIR/intermediate.pem

# Download intermediate if doesn't exist
if [ ! -f $INTERMEDIATE ] ; then
    wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > $INTERMEDIATE
fi

cd $CONFIG_DIR
for domain in * ; do
    if [ -f "$domain/$domain.csr" ] ; then
        crt=$domain/$domain.crt
        csr=$domain/$domain.csr

        acme_dir=/home/letsencrypt/webroot
        if [ ! -d $acme_dir ] ; then
            mkdir -p $acme_dir
        fi

        ## If crt doesn't exist, generate crt
        if [ ! -f $crt ] ; then
            echo "Trying to generate certificate for domain $domain…"
            python $ACME_BIN --account-key $ACCOUNT_KEY --csr $csr --acme-dir $acme_dir > $crt.new
            if [ "$?" -ne "0" ] ; then
                rm -f $crt.new
                echo "Certificate for $domain has NOT been successfully generated, please check." | mail -s "ERROR on certificate generation for $domain on $(hostname)" $ADMIN_EMAIL
            else
                mv $crt.new $crt
                cat $domain/$domain.key $crt $INTERMEDIATE > /home/letsencrypt/bundles/$domain.pem
                echo "Certificate for $domain generated !"
            fi
        else
            # If crt is too close to expiration, regen crt
            crt_end_date=$(openssl x509 -in "$crt" -noout -enddate | sed -e "s/.*=//")
            date_crt=$(date -ud "$crt_end_date" +"%s")
            date_today=$(date +'%s')
            date_jour_diff=$(( ( $date_crt - $date_today ) / (60*60*24) ))
            if [ $date_jour_diff -le 30 ] ; then
                echo "Trying to renew certificate for domain $domain expiring in $date_jour_diff days…"
                python $ACME_BIN --account-key $ACCOUNT_KEY --csr $csr --acme-dir $acme_dir > $crt.new
                if [ "$?" -ne "0" ] ; then
                    rm -f $crt.new
                    echo "Certificate for $domain has NOT been successfully renewed, please check." | mail -s "ERROR on certificate renew for $domain on $(hostname)" $ADMIN_EMAIL
                else
                    cp $crt $crt.old
                    mv $crt.new $crt
                    cat $domain/$domain.key $crt $INTERMEDIATE > /home/letsencrypt/bundles/$domain.pem
                    echo "Certificate for $domain renewed !"
                fi
            else
                echo "Certificate for $domain doesn't need to be renewed (expires in $date_jour_diff days)."
            fi
        fi
    fi
done
