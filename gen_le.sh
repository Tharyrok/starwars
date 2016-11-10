#!/bin/bash

mkdir "secured/ssl/domains/$1/"

openssl genrsa -out "secured/ssl/domains/$1/$1.key" 4096
openssl req -new -sha256 -key "secured/ssl/domains/$1/$1.key" -subj "/CN=$1" -out "secured/ssl/domains/$1/$1.csr"

