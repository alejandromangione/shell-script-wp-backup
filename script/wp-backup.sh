#!/bin/bash

echo ""
echo "========================================================="
echo "======= Script to Backup WordPress Sites ================"
echo "========================================================="

now=$(date +'%Y-%m-%d-%H%M')

echo "- Backup database"
read -p "Database name: " name_db
read -p "Enter user: " user_db
read -p "Enter host: " host_db

mysqldump -h $host_db -u $user_db -p -R --opt $name_db > $now'_backup-dump-wp-db.sql'

echo ""
echo "- Database file: "$now'-backup-dump-wp-db.sql'
echo ""

echo "- Backup WP Files"


echo "- Enter directory path:"
read -p "Enter WP folder name: /var/www/" folder_wp
path="/var/www/"$folder_wp
        
zip -r $now"-backup-wp-files.zip" $path"/"
