#!/bin/bash


command=htop


if command -v $command
then
   echo $command is avaliable
else
   echo $command is not avaliable, installing it.
   sudo apt update && sudo apt install -y $command
fi

$command
