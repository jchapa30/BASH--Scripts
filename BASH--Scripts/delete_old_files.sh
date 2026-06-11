#!/bin/bash

TARGET_DIR="/home/jchapa30/Devops/BASH--Scripts/BASH--Scripts"

find "$TARGET_DIR" -type f -mtime +30 -delete
