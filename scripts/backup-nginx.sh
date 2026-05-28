#!/bin/bash

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR="/backup"
SOURCE_DIR="/var/www/html"
BACKUP_FILE="$BACKUP_DIR/nginx-backup-$DATE.tar.gz"

tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup created: $BACKUP_FILE"
