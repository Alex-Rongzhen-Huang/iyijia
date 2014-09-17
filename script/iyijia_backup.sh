#!/bin/bash

APP_PATH=$1
BACKUP_PATH=$2

usage()
{
    echo -e "\nUsage: iyijia_backup.sh [Application Path] [Backup Path]"
    echo -e "Example: iyijia_backup.sh /home/hao/github/iyijia /home/hao/backup\n"
}

if [[ ! $APP_PATH || ! $BACKUP_PATH ]]; then
  usage
  exit 1
fi

BACKUP_DATE=`date -d today +'%Y-%m-%d_%H-%M'`
#echo "localhost:5432:iyijia_development:postgres:postgres">~/.pgpass
#chmod 600 ~/.pgpass

pg_dump -i -h localhost -p 5432 -U postgres -F c -b -v -f "${BACKUP_PATH}/${BACKUP_DATE}.sql" iyijia_development

cd $APP_PATH/public
tar -cvf "${BACKUP_PATH}/${BACKUP_DATE}.tar" uploads
