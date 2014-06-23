#!/usr/bin/env bash

block="server {
    listen 80;
    server_name $1;
    root $2;
    include hhvm.conf;

    index index.html index.htm index.php index.hh;

    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/$1-error.log error;

    error_page 404 /index.php;

    sendfile off;

    location ~ /\.ht {
        deny all;
    }
}
"

echo "$block" >> "/etc/nginx/sites-available/$1"
ln -s "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
service nginx restart
/etc/init.d/hhvm restart

