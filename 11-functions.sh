#!/bin/bash
#check if the current user is the root user

if [ "$(id -u )" -ne 0 ]; then
    echo "You do not have privileges to run the script"
    exit 1
fi

#check if the MySQL package is already installed

if ! dnf list installed mysql &> /dev/null; then
    echo "mysql is not found. Proceeding to install"

    #installnig MySql and verifying if it was installed scucessfully
    if dnf install mysql -y; then
        echo "mysql installed successfully"
    
    else
        echo "mysql installation failed"
        exit 1
    fi
else
    echo "MySql is already installed"
    exit 0
fi

