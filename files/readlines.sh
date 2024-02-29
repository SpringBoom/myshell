

# 读取 data 文件，将每一行替换到配置文件中
data_file=$1
result_file=$2

template_cf=

while read line
do
  echo $line
  # 将 template_cf 文件内容中 _R_ 替换为 $line
  sed "s/_R_/$line/" >> $result_file
done < $data_file