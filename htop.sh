#!/bin/bash

command=/usr/bin/htop

if [ -f $command ]
then
 echo " $command is avaliable. Lets run it"
else
   echo "Command not avaliable, install it"
   sudo apt update && sudo apt install -y htop
fi

$command 
