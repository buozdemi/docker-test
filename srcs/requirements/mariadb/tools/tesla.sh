#!/bin/bash

dosya="/home/buozdemi/test2/srcs/.env"

while IFS= read -r line; do
  if [[ "$line" == "DOMAIN_NAME="* ]]; then
    DOMAIN_NAME="${line#*=}"
  elif [[ "$line" == "MYSQL_HOSTNAME="* ]]; then
    MYSQL_HOSTNAME="${line#*=}"
  elif [[ "$line" == "MYSQL_DATABASE="* ]]; then
    MYSQL_DATABASE="${line#*=}"
  elif [[ "$line" == "MYSQL_USER="* ]]; then
    MYSQL_USER="${line#*=}"
  elif [[ "$line" == "MYSQL_PASSWORD="* ]]; then
    MYSQL_PASSWORD="${line#*=}"
  elif [[ "$line" == "MYSQL_ROOT_NAME="* ]]; then
    MYSQL_ROOT_NAME="${line#*=}"
  elif [[ "$line" == "MYSQL_ROOT_PASSWORD="* ]]; then
    MYSQL_ROOT_PASSWORD="${line#*=}"
  fi
done < "$dosya"

str1="CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
ALTER USER '$MYSQL_ROOT_NAME'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

echo "$str1" > ./srcs/requirements/mariadb/tools/initial_db.sql
chmod 777 ./srcs/requirements/mariadb/tools/initial_db.sql
