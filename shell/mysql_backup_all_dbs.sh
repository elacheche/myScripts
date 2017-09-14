#!/usr/bin/env bash

DIRBASE="/var/backups/MySQL"
USER=""
PASSWORD=""

rm $DIRBASE/*

for db in $(mysql -u $USER -p$PASSWORD -e "show databases")
        do echo "=== $db ==="
        name=$db"-"$(date +%d_%m_%y)
        echo $name
        mysqldump -u $USER -p$PASSWORD --skip-extended-insert --skip-dump-date $db > $DIRBASE/$name.sql
done &> $DIRBASE/cron.log

chown backup:backup -R $DIRBASE                     
