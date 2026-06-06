#!/bin/bash


#Author: Joey Chapa
#Date: 6/6/26
#Description: Check if a user exists and create it if not

echo What is your username?
read b
echo
echo Hello $b
echo

if id "$b" &>/dev/null
then
   echo "$b username was found"
else
   echo "User does not exist, so it was created."
   sudo adduser "$b"
fi
