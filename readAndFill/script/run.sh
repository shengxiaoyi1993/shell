#!/bin/bash
read -p "Please input password for sudo:" val_password

echo ${val_password} | sudo -S yum install lftp -y
