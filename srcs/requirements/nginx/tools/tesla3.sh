#!/bin/bash

file1="./srcs/.env"

while IFS= read -r line; do
  if [[ "$line" == "DOMAIN_NAME="* ]]; then
    DOMAIN_NAME="${line#*=}"
  elif [[ "$line" == "CERTS_="* ]]; then
    CERTS_="${line#*=}"
  elif [[ "$line" == "CERTS2_="* ]]; then
    CERTS2_="${line#*=}"
  fi
done < "$file1"

str1="server {
 listen 443 ssl;
 listen [::]:443 ssl;
 server_name $DOMAIN_NAME;

 ssl_certificate $CERTS_;
 ssl_certificate_key $CERTS2_;
 ssl_protocols  TLSv1.2 TLSv1.3;

 root /var/www/html;
 index index.php index.nginx-debian.html;

 location / {
  try_files \$uri \$uri/ /index.php\$is_args\$args;
 }

 location ~ \.php$ {
   fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass wordpress:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    fastcgi_param SCRIPT_NAME \$fastcgi_script_name;
 }
}"

echo "$str1" > ./srcs/requirements/nginx/conf/nginx.conf
chmod 777 ./srcs/requirements/nginx/conf/nginx.conf
