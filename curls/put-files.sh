#
IP=127.0.0.1
PORT=5100
UIL=/test/get

success=success
log_file=curl.log
finish_path=./finished/
faild_path=./faild/

tag_dir=$1
files=$(ls $tag_dir)
for filename in $files; do
    echo >> curl.log
    echo `date` >> curl.log
    echo ${filename} >> curl.log
    reponse=`curl --location --request POST http://${IP}:${PORT}${UIL} --form tagsFile=@${tag_dir}${filename}`
    echo "$response"  >> curl.log
    echo "$response"

    if [[ $response == *$success* ]]
    then
        echo "success"
        mv ${tag_dir}${filename} $finish_path
    else
        echo "faild"
        mv ${tag_dir}${filename} $faild_path
    fi
    echo "sleep..."
    sleep 5s
done