#!/usr/bin/env bash

declare -A params=$6       # Create an associative array
declare -A headers=${9}    # Create an associative array
declare -A rewrites=${10}  # Create an associative array
paramsTXT=""
if [ -n "$6" ]; then
   for element in "${!params[@]}"
   do
      paramsTXT="${paramsTXT}
      fastcgi_param ${element} ${params[$element]};"
   done
fi
headersTXT=""
if [ -n "${9}" ]; then
   for element in "${!headers[@]}"
   do
      headersTXT="${headersTXT}
      add_header ${element} ${headers[$element]};"
   done
fi
rewritesTXT=""
if [ -n "${10}" ]; then
   for element in "${!rewrites[@]}"
   do
      rewritesTXT="${rewritesTXT}
      location ~ ${element} { if (!-f \$request_filename) { return 301 ${rewrites[$element]}; } }"
   done
fi

if [ "$7" = "true" ]
then configureXhgui="
location /xhgui {
        try_files \$uri \$uri/ /xhgui/index.php?\$args;
}
"
else configureXhgui=""
fi

block="server {
    listen ${3:-80};
    listen ${4:-443} ssl http2;
    server_name .$1;
    root \"$2\";
    charset utf-8;
    index index.html index.htm index.php;
    $rewritesTXT

    location ~ ^/system/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-system/public/;
        index index.php;
        try_files \$uri \$uri/ @system;
    }
    location @system {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-system/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }


    location ~ ^/vote/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-vote/public/;
        index index.php;
        try_files \$uri \$uri/ @vote;
    }
    location @vote {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-vote/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }


    location ~ ^/groupbuy/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-groupbuy/public/;
        index index.php;
        try_files \$uri \$uri/ @groupbuy;
    }
    location @groupbuy {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-groupbuy/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }


    location ~ ^/notifier/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-notifier/public/;
        index index.php;
        try_files \$uri \$uri/ @notifier;
    }
    location @notifier {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-notifier/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ ^/housedict/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-housedict/public/;
        index index.php;
        try_files \$uri \$uri/ @housedict;
    }
    location @housedict {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-housedict/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ ^/media/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-media/public/;
        index index.php;
        try_files \$uri \$uri/ @media;
    }
    location @media {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-media/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }


    location ~ ^/site/(.*)$ {
        alias /home/vagrant/code/service.loupan.com-site/public/;
        index index.php;
        try_files \$uri \$uri/ @site;
    }
    location @site {
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /home/vagrant/code/service.loupan.com-site/public/index.php;
        fastcgi_param SCRIPT_NAME     /index.php;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
        $headersTXT
    }

    $configureXhgui

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/$1-error.log error;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php$5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        $paramsTXT

        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ /\.ht {
        deny all;
    }

    ssl_certificate     /etc/nginx/ssl/$1.crt;
    ssl_certificate_key /etc/nginx/ssl/$1.key;
}
"

echo "$block" > "/etc/nginx/sites-available/$1"
ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
