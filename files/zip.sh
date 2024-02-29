#!/bin/bash

read -p "Enter your file: " NAME
echo $NAME

#echo ${array[${#array[@]}-1]}
file=${NAME##*/}
#echo ${file}
path=${NAME%/*}
#echo ${path}
cd ${path}
#echo `ls`
echo "请输入密码，回车后再输入一遍"
zip -r $file.zip $file -e
echo success zip ${path}/$file
read -t 3 -p "byebye " NAME