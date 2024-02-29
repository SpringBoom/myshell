#!/bin/sh

#
# 从开始日期开始，循环到结束日期，步长为 1 天，循环日期变量为 dt
# 将循环日期 dt 转换为时间戳
# 时间戳作为 sql 的查询参数
#
startDate=20240227
endDate=$(date +%Y%m%d)

currDay=$startDate
numDays=$(( ($(date -d $endDate +%s) - $(date -d $startDate +%s)) / 86400 ))

echo $numDays

# Loop through each day
#for (( i=0; i<=5; i++ ))
for i in `seq $numDays`
do
  currDay=$(date -d "$startDate +$i days" +%Y%m%d)
  dt=$(date -d "$currDay" +%s)
  addressSql="
    select count(address)
    from (
            SELECT address,
                    argMax(balance, timestamp) AS balance
            FROM (
                    select *
                    from omni_usdt_address_record
                    where timestamp <= ${dt}000
                    )
            GROUP BY address) tmt
    where tmt.balance >= 10000000;
    "
  echo "currDay: $currDay, $dt"
  echo "$addressSql"
done