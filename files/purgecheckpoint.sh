#!/bin/bash
# 清理checkpoint, 保留最新的 saveCount 个checkpoints
# RemoveDir 是 checkpoint 的主目录

RemoveDir=$1
# $2 是需要保留的文件个数
begin_line=$[ $2 + 1 ]

for subdir in `ls $RemoveDir`;do
  for filename in `ls -c $RemoveDir/$subdir | tail -n  +$begin_line `;do
        rm -rf $RemoveDir/$subdir/${filename}
     done
done
