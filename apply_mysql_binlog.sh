#!/bin/bash

CMD_NAME=$(basename $0)
MYSQL_FOLDER=$1
IMAGE=wushaobo/percona-xtrabackup

if [ ! -d "${MYSQL_FOLDER}" ]; then
	echo "Usage: ${CMD_NAME} /ABSOLUTE/PATH/TO/MYSQL_SNAPSHOT/FOLDER"
	exit 1
fi

docker run --rm --name mysql_tmp -v ${MYSQL_FOLDER}:/data/mysql ${IMAGE} innobackupex --apply-log /data/mysql/