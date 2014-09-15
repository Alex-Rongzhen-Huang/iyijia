#!/bin/bash
BACKUP_DATE=`date -d today +'%Y-%m-%d'`
echo "localhost:5432:iyijia_development:postgres:postgres">~/.pgpass
chmod 600 ~/.pgpass
pg_dump -i -h localhost -p 5432 -U postgres -F c -b -v -f "/home/hao/backup/${BACKUP_DATE}.sql" iyijia_development
tar -cvf "/home/hao/backup/${BACKUP_DATE}.tar" /home/hao/github/iyijia/public/uploads 