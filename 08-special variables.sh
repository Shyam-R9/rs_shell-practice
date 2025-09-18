#!/bin/bash

echo "Name of the script: $0"
echo "No of arguments passed to the script: $#"
echo "Home directory of the user running the script: $HOME"
echo "User running the script: $USER"
sleep 10 &
echo "PID of the script: $$"
echo "PID of the last command: $!"
echo "All variables passed to the script: $@"
echo "All vars: $*"