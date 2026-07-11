#!/bin/bash


#Author: Joey Chapa
#Date: 6/6/26
#Description: Check if a user exists and create it if not

set -uo pipefail

echo What is your username?
read -r b
echo
echo "Hello $b"
echo

if [ -z "$b" ]; then
   echo "Error: no username provided." >&2
   exit 1
fi

if id "$b" &>/dev/null
then
   echo "$b username was found"
else
   echo "User does not exist, creating it."
   if sudo adduser "$b"; then
      echo "User '$b' was created."
   else
      echo "Error: failed to create user '$b'." >&2
      exit 1
   fi
fi
