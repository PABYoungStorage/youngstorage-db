#!/bin/bash

readonly EXPECTED_ARGS=2
readonly E_BADARGS=65

#mysql query
readonly Q1="CREATE DATABASE IF NOT EXISTS $1;"
readonly Q2="GRANT ALL PRIVILEGES ON $1.* TO '$2'@'%';"
readonly Q3="${Q1}${Q2}"

#checking expected args
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: dbname dbuser"
  exit $E_BADARGS
fi

#creating database 
password=example
mysql -h 127.0.0.1 -u root -p$password -e "$Q3"
echo "Database is Created Successfully"