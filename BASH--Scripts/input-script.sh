#!/bin/bash

#Author: Joey Chapa
#Date: 6/6/26
#Description:

a=$(hostname)

echo "Hello $USER, your hostname is $a."
echo
echo "What is your name?"
read -r name
echo
echo "Hello $name"
echo
