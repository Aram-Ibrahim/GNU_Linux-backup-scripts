#!/bin/bash
BACKUP_DIR="/backup"
FILES_TO_BACKUP=("/etc" "/var/www" "/home/user" "/root")

KEEPING_PERIOD=30

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

for file in "${FILES_TO_BACKUP[@]}"; do
  rsync -avz --delete "$file" "$BACKUP_DIR/$TIMESTAMP/"
done


find "$BACKUP_DIR" -type d -mtime +$KEEPING_PERIOD -exec rm -rf {} \;


echo "$TIMESTAMP Backup Done." >> /var/log/backup.log


if [ $? -ne 0 ]; then
  echo "Error: backup failed!"
fi
