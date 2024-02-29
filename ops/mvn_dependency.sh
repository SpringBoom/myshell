#/bin/bash
cd "$(dirname "$0")"
day=`date +%Y%m%d%H%M`
MAIN_PATH=`pwd`
echo $MAIN_PATH

BASE_PATH=$1
LOG=$2
for pom_path in `find $BASE_PATH -name pom.xml`;
    do
    mpp=${pom_path%/*}
    cd ${mpp}
    echo $mpp
    artifactId=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
    echo $artifactId
    out_f=${LOG}/${artifactId}.txt
    echo ${out_f}
    mvn dependency:tree -l ${out_f}

    A=$(sed -n '$=' ${out_f})
    B=$(($(wc -l < ${out_f})-5))

    sed "$B,\$d" ${out_f} > ${out_f}-tmp
    sed '1,7d;' ${out_f}-tmp > ${out_f}
    rm ${out_f}-tmp
done
