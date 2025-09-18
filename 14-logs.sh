#!/bin/bash

USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/logs/Shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

#check if the user is root

mkdir -p LOG_FOLDER
echo "Script execution started at $(date) | tee -a $LOG_FILE

is_root_user() {
    if [ $(id -u) -ne 0 ]; then
        echo -e " $R Error: $N You are not a root user to perform this action" | tee -a $LOG_FILE
        exit 1
    fi
}

#check if the package is already installed, if not installed, proceed to install

is_package_already_installed() {
    local package=$1
    
    if dnf list installed $package &> /dev/null; then
        echo -e "$Y $package already installed $N" | tee -a $LOG_FILE
    
    else
        echo -e "$R $package not installed, proceeding to install $N"
        dnf install $package -y
    
        if [ $? -nq 0 ]; then
            echo -e "$R $package installation failed $N" | tee -a $LOG_FILE
            exit 1
        else
            echo -e "$G $package installed successfully $N" | tee -a $LOG_FILE
        fi 
    fi

}

is_root_user

packages=("mysql" "python3" "nginx")

for package in "${packages[@]}"; do
    is_package_already_installed "$package"
done
