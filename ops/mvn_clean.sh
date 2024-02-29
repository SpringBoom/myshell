#/bin/bash
cd "$(dirname "$0")"
day=`date +%Y%m%d%H%M`
MAIN_PATH=`pwd`
echo $MAIN_PATH
BASE_PATH=/$PROJECT_PATH
LOG=$MAIN_PATH/logs/$day.out
for pom_path in `find $BASE_PATH -type d -name target`;
    do
    mpp=${pom_path%/*}
    if [ -f "${mpp}/pom.xml" ];then
        cd ${mpp}
        echo `pwd` >> $LOG
        mvn clean >> $LOG
    fi
done