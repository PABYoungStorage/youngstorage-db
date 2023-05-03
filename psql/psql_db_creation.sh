#!/bin/bash

readonly EXPECTED_ARGS=2
readonly E_BADARGS=65

#psql query to create database

readonly Q1="SELECT 'CREATE DATABASE $1 OWNER $2;'"
# WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$1')\gexec"
readonly Q2="grant all privileges on database $1 to $2;"
readonly Q4="REVOKE CONNECT ON DATABASE $1 FROM PUBLIC;"
readonly Q3="${Q1}${Q2}${Q4}"

#checking expected args
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: dbname dbuser"
  exit $E_BADARGS
fi

#creating database
psql -U postgres -c "$Q3"