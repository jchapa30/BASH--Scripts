#!/bin/bash


#Author: Joey Chapa
#Date: 6/6/26
#Description: Check if a user exists and create it if not

echo "What is your username?"
read -r username
echo

if [[ ! "$username" =~ ^[a-z_][a-z0-9_-]{0,31}$ ]]
then
   echo "Invalid username. Use 1-32 lowercase letters, numbers, underscores, or hyphens."
   exit 1
fi

echo "Hello $username"
echo

if id -- "$username" &>/dev/null
then
   echo "$username username was found"
else
   echo "User does not exist, so it will be created."
   sudo adduser "$username"
fi
