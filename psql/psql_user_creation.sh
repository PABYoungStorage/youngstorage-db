#!/bin/bash

readonly EXPECTED_ARGS=2
readonly  E_BARDARGS=65

#PSQL User_Creation
readonly Q1="CREATE USER $1 WITH PASSWORD '$2';"


#checking all arguments are passed to the command line (while executing the script)
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: ./script.sh username password"
  exit $E_BADARGS
fi

#logging in to the psql server and creating user
psql -U postgres -c "$Q1"