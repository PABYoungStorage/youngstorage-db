#!/bin/bash

green() {
  echo -e '\e[32m'$1'\e[m';
}

readonly EXPECTED_ARGS=3
readonly E_BADARGS=65
readonly MYSQL=`which mysql`

# Construct the MySQL query
readonly Q1="CREATE USER '$2'@localhost IDENTIFIED BY '$3';"
readonly Q2="CREATE DATABASE IF NOT EXISTS $1;"
readonly Q3="GRANT ALL PRIVILEGES ON $1.* TO '$2'@localhost;"
readonly SQL="${Q1}${Q2}${Q3}"

# Do some parameter checking and bail if bad
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi

# Run the actual command
password=example
$MYSQL -h 127.0.0.1 -u root -p$password -e "$SQL"

# Let the user know the database was created
green "Database $1 and user $2 created with a password you chose"
