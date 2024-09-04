#!/bin/bash
BACKUP_DIR="/backup"
FILES_TO_RESTORE=("/etc" "/var/www" "/home/user")

echo "Enter the timestamp of the backup to restore (in YYYY-MM-DD-HH-MM-SS format):"
read TIMESTAMP

TMP_DIR=$(mktemp -d)

for file in "${FILES_TO_RESTORE[@]}"; do
  rsync -avz --delete "$BACKUP_DIR/$TIMESTAMP/$file" "$file"
done

rm -rf "$TMP_DIR"

echo "$TIMESTAMP Restore done." >> /var/log/restore.log

if [ $? -ne 0 ]; then
  echo "Error: restore failed!"
fi





