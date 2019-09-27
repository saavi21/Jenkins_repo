#!/bin/bash
echo "GIT SETUP DIRECTORY FOR SCRIPT REPOSITORY "
echo "------------------------------------------"
echo "Creating export directory for backup to be taken"
sudo mkdir -p /home/shared/export/python
sudo mkdir -p /home/shared/export/shell
echo "Creating TEMP directory for backup to be performed using git --> clone path"
sudo  mkdir -p /home/shared/TEMP/script/python
sudo  mkdir -p /home/shared/TEMP/script/shell

cd /home/shared/TEMP
sudo git init
sudo git config --global user.email "onkar7.ojha7@gmail.com"
sudo git config --global user.name "onkar"
sudo /home/onkar/script_jenkins/Jenkins_repo/backup_repo_script.sh


