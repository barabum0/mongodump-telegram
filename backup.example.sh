#!/bin/bash

# MongoDB connection URL
MONGO_URL="mongodb://your_username:your_password@your_host:your_port/your_database"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"
BACKUP_NAME="mongodb_backup_$(date +%Y%m%d%H%M%S)"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Telegram Bot details
BOT_TOKEN="your_bot_token"
CHAT_ID="your_chat_id"
TELEGRAM_URL="https://api.telegram.org/bot$BOT_TOKEN/sendDocument"

# Create a backup
mongodump --uri="$MONGO_URL" --out="$BACKUP_PATH"

# Calculate uncompressed backup size
UNCOMPRESSED_SIZE=$(du -sh "$BACKUP_PATH" | cut -f1)

# Compress the backup
tar -czvf "$BACKUP_PATH.tar.gz" -C "$BACKUP_DIR" "$BACKUP_NAME"

# Format date and time
BACKUP_DATE=$(date "+%Y-%m-%d")
BACKUP_TIME=$(date "+%H:%M:%S")

# Backup caption with emojis and markdown
BACKUP_CAPTION=$'📦 *MongoDB Backup*\n📅 Date: '"$BACKUP_DATE"$'\n⏰ Time: '"$BACKUP_TIME"$'\n🗂 Uncompressed Size: '"$UNCOMPRESSED_SIZE"

# Send the backup to Telegram chat with a formatted caption
curl -F chat_id="$CHAT_ID" -F caption="$BACKUP_CAPTION" -F parse_mode="Markdown" -F document=@"$BACKUP_PATH.tar.gz" $TELEGRAM_URL

# Remove the backup file and directory
rm "$BACKUP_PATH.tar.gz"
rm -rf "$BACKUP_PATH"
