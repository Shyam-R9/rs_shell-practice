#!/bin/bash

#check if the user is root

is_root_user() {
    if [ $(id -u) -ne 0 ]; then
        echo -e "\e[31m Error: You are not a root user to perform this action \e[0m"
        exit 1
    fi
}

#check if the package is already installed, if not installed, proceed to install

is_package_already_installed() {
    local package=$1
    
    if dnf list installed $package &> /dev/null; then
        echo -e "\e[33m $package already installed \e[0m"
    
    else
        echo -e "\e[33m $package not installed, proceeding to install \e[0m"
        dnf install $package -y
    
        if [ $? -nq 0 ]; then
            echo -e "\e[32m $package installation failed \e[0m"
            exit 1
        else
            echo -e "\e[32m $package installed successfully \e[0m"
        fi 
    fi

}

is_root_user

packages=("mysql" "python3" "nginx")

for package in "${packages[@]}"; do
    is_package_already_installed "$package"
done
