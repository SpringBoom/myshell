#!/bin/bash

# 根据配置文件模板批量生成配置文件
#

# 模板文件
template_cf=$1
data_file=$2
out_path=./out/


# 判断 out_path 是否存在
if [ ! -d $out_path ];then
  mkdir  $out_path 
fi

cf_suffix=${template_cf##*.}
echo $cf_suffix

# 读取 data 文件，将每一行替换到配置文件中
while read line
do
  echo $line
  name=`echo $line | sed 's/[[:space:]]//g'`
  echo $name
  # 将 template_cf 文件内容中 _R_ 替换为 $line
  cat $template_cf | sed "s/_R_/$line/" >> $out_path$name.$cf_suffix
done < $data_file