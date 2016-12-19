#!/bin/bash

CMD_NAME=$(basename $0)
MYSQL_FOLDER=$1

if [ ! -d "${MYSQL_FOLDER}" ]; then
	echo "Usage: ${CMD_NAME} /ABSOLUTE/PATH/TO/MYSQL_SNAPSHOT/FOLDER"
	exit 1
fi

docker run --name mysql_tmp -v ${MYSQL_FOLDER}:/data/mysql daocloud.io/shaobo_wu/percona-binlog-recover innobackupex --apply-log /data/mysql/
docker rm mysql_tmp