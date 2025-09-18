#!/bin/bash
#check if the current user is the root user

if [ "$(id -u )" -ne 0 ]; then
    echo "Error: You do not have privileges to run the script"
    exit 1
fi

is_package_already_installed() {
    if ! dnf list installed $1 &> /dev/null; then
        echo "mysql is not found"
    else
        echo "MySql is already installed"
        exit 0
    fi
}

#Insall the package and verify the installation 
install_package() {
    if dnf install mysql -y; then
        echo "mysql installed successfully"
    
    else
        echo "mysql installation failed"
        exit 1
}

