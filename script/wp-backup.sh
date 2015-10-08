#!/bin/bash

echo "\n"
echo "========================================================="
echo "======= Script to Backup WordPress Sites ================"
echo "=========================================================\n"

now=$(date +'%Y%m%d')

echo "- Backup database\n"
read -p "Database name: " name_db
read -p "Enter user: " user_db
read -p "Enter host: " host_db

mysqldump -h $host_db -u $user_db -p -R --opt $name_db > $now'-backup-dump-wp-brasilct.sql'

echo "\n"
echo "- Database file: "$now'-backup-dump-wp-brasilct.sql'
echo "\n"

echo "- Backup WP Files\n"

path="-"

while [ ! -d $path ]
do
        echo "Directory $path not exists."
        read -p "Enter WP folder name: /var/www/" folder_wp
        path="/var/www/"$folder_wp
done

zip -r $now"-backup-wp-brasilct-files.zip" $path"/"