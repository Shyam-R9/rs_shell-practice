#!/bin/bash

#check if the user is root

is_root_user() {
    if [ $(id -u) -ne 0 ]; then
        echo "Error: You are not a root user to perform this action"
        exit 1
    fi
}

#check if the package is already installed, if not installed, proceed to install

is_package_already_installed() {
    if dnf list installed $package &> /dev/null; then
        echo "$package already installed"
        exit 0
    else
        echo "$package not installed, proceeding to install"
        dnf install $package -y
        if ($? -nq 0); then
            echo "$package installation failed"
            exit 1
        else
            echo "$package installed successfully"
        fi 
    fi

}

is_root_user

packages=("mysql" "python3" "nginx")

for package in "{packages[@]}"; do
    is_package_already_installed "$package"
done
