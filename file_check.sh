#!/bin/bash

if [ -f "$HOME/myfile" ]
then
   echo "File exists"
else
   echo "File does not exist"
   touch "$HOME/myfile"
fi
