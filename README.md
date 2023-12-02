# MongoDB Backup Script

This repository contains a Bash script for automating backups of MongoDB databases. The script performs a backup using `mongodump`, compresses the backup, and sends it to a specified Telegram chat using the Telegram Bot API.

## Features

- Automated backup of MongoDB databases.
- Backup compression using `tar.gz`.
- Uploads backup file to Telegram for easy and secure retrieval.

## Prerequisites

Before using this script, you need to have:

- MongoDB installed and running on your system.
- `mongodump` utility (usually comes with MongoDB).
- A Telegram bot token and chat ID where backups will be sent.

## Installation

1. **Download the script:**
   ```bash
   wget https://raw.githubusercontent.com/barabum0/mongodump-telegram/main/backup.example.sh -O mongodb_backup.sh
   ```

2. **Make the Script Executable:**
   ```bash
   chmod +x mongodb_backup.sh
   ```

3. **Configure the Script:**
   Edit `mongodb_backup.sh` to set your MongoDB connection details, Telegram Bot Token, and Chat ID.

## Usage

To manually run the backup script:

```bash
./mongodb_backup.sh
```

To schedule automatic backups using cron:

1. Open your crontab file:
   ```bash
   crontab -e
   ```

2. Add the following line to run the script every 4 hours:
   ```cron
   0 */4 * * * /path/to/your/script/mongodb_backup.sh
   ```
   
## Contributing

Contributions to this script are welcome. Please fork the repository and submit a pull request for any enhancements.

## License

This script is licensed under an [MIT license](LICENSE)