#!/bin/bash
BACKUP_PATH=$1
BACKUP_TIME=$2
APP_PATH=$3

usage()
{
    echo -e "\nUsage: iyijia_restore.sh [Application Path] [Backup Path]"
    echo -e "Example: iyijia_restore.sh /home/hao/backup 2014-09-15_08_01 /home/hao/github/iyijia\n"
}

if [[ ! $APP_PATH || ! $BACKUP_PATH || ! $BACKUP_TIME ]]; then
  usage
  exit 1
fi

rm -rf  $APP_PATH/public/uploads
tar -xvf $BACKUP_PATH/$BACKUP_TIME.tar -C $APP_PATH/public/

echo "localhost:5432:iyijia_development:postgres:postgres">~/.pgpass
chmod 600 ~/.pgpass
pg_restore -i -h localhost -p 5432 -U postgres -c -d iyijia_development -v $BACKUP_PATH/$BACKUP_TIME.sql
