#!/bin/bash

# Script to list all processes for the current user

echo " Listing all process for user: $USER"
echo " Process running"

echo "-----------------------------------"

ps aux | grep "^$USER" | grep -v grep
