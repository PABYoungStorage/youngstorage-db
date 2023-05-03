#!/bin/bash

readonly EXPECTED_ARGS=2
readonly E_BADARGS=65

#MYSQL User_Creation
readonly Q1="CREATE USER '$1'@'%' IDENTIFIED BY '$2';"

#checking all arguments are passed to the command line (while executing the script)
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: ./script.sh username password"
  exit $E_BADARGS
fi

#logging in to the mysql and creating user
password=example
mysql -h 127.0.0.1 -u root -p$password -e "$Q1"
echo "User Created Successfully"