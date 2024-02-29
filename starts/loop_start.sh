#!/bin/bash
# 判断 APP 运行停止后，修改参数继续启动
#
APP_JAR=parser-2.0-SNAPSHOT-jar-with-dependencies.jar
wallet_dir=../conf/0916
files=$(ls $wallet_dir)
for filename in $files; do
    echo >> shell.out
    echo `date` >> shell.out
    echo $wallet_dir/$filename >> shell.out
    PID=$(ps -ef | grep ${APP_JAR} | grep -v grep | awk '{ print $2 }')
    if [ -z "$PID" ]
    then
    # 不存在
        echo ${APP_JAR} is already stopped
    sh ./for-config-tagWallet.sh $wallet_dir/$filename
    else
    # 存在
      while true
      do
        echo ${APP_JAR} is running
        sleep 1m
        PID=$(ps -ef | grep ${APP_JAR} | grep -v grep | awk '{ print $2 }')
    if [ -z "$PID" ]
        then
          echo ${APP_JAR} is already stopped
          sh ./for-config-tagWallet.sh $wallet_dir/$filename
      break
        fi
      done
    fi
    sleep 10s
done