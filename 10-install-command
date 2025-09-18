#!/bin/bash
#check if the current user is root user

if [ "$(id -u )" -ne 0 ]; then
    echo "You do not have privileges to run the script"
    exit 1
fi
#check if the package is already installed
if ! dnf list installed mysql &> /dev/null; then
    echo "mysql is not found. Proceeding to install"
    if dnf install mysql -y; then
        echo "mysql installed successfully"
    
    else
        echo "mysql installation failed"
        exit 1
    fi
else
    echo "mysql already installed"
    exit 0
fi

