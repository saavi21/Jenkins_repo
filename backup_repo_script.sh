#!/bin/bash
###!/usr/bin/env bash
#mv /onkar/.profile.bak /onkar/.profile
# you can run the programe to take backup from any where..
#Before that make sure you have /home/shared/export/.. folders and you need to: keep .sh, .py, .yml files at shell, python and ansible folders
#Also you need to create /home/shared/TEMP/  so that git will clone there. And script can append your files from /home/shared/export/.  into /home/shared/TEMP/  and commit to git. 

USER[0]='saavi21'
USER[1]='GithubSr1Ram'
ADDRESS[0]='/home/shared/export/python'
ADDRESS[1]='/home/shared/TEMP/script/python'
ADDRESS[2]='/home/shared/export/shell'
ADDRESS[3]='/home/shared/TEMP/script/shell'
declare -a value=(0 0 0 0)
commit_path='/home/shared/TEMP/script'
clone_path='/home/shared/TEMP'
cd $clone_path
rm -rf script;
/usr/bin/git clone https://${USER[0]}:${USER[1]}@github.com/saavi21/script.git

x=0
while [ $x -lt 3 ]
do
cd ${ADDRESS[x]}
cp -rf ${ADDRESS[x]}/* ${ADDRESS[x+1]}
cd ${ADDRESS[x+1]}
count=`ls -ltr | wc -l`
num=`expr $count - 1`
echo -e "\n Total number of files to ${ADDRESS[x+1]} is: $num "
value[x+1]="$num"
x=`expr $x + 2`
done

msg="Backup for :- python=${value[1]} \n shell=${value[3]}"
echo -e "Total number of $msg"

echo "Check of testing successful of cloneing"

##committing code ## 
cd $commit_path
git add --all
git commit -m "$msg"
sleep 1m
#git remote add origin https://saavi21@github.com/saavi21/script.git
#git push origin master
/usr/bin/git push https://${USER[0]}:${USER[1]}@github.com/saavi21/script.git
