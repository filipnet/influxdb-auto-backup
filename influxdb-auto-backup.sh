#!/bin/bash
# InfluxDB Backup Script
#
# This script creates backups of specified InfluxDB databases and retains them
# based on the specified retention period. You can configure multiple databases
# by adding them to the DATABASES array.
#
# Configuration:
# - INFLUXDB_HOST: Hostname or IP address of the InfluxDB server
# - INFLUXDB_PORT: Port number of the InfluxDB server
# - BACKUP_DIR: Directory to store the backup files
# - RETENTION_DAYS: Number of days to retain the backups
# - DATABASES: Array of databases to be backed up

INFLUXDB_HOST="localhost"
INFLUXDB_PORT="8086"
BACKUP_DIR="/path/to/backup/directory"
RETENTION_DAYS=7
DATABASES=("database1" "database2" "database3")

# Create backup directory if it doesn't exist
if [ ! -d $BACKUP_DIR ]; then
    mkdir -p $BACKUP_DIR
fi

# Get current timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Loop through each database and create backup
for DATABASE in "${DATABASES[@]}"; do
    # Backup file name
    BACKUP_FILE="$BACKUP_DIR/influxdb_backup_${DATABASE}_${TIMESTAMP}.tar.gz"

    # Create backup
    influxd backup -portable -host $INFLUXDB_HOST:$INFLUXDB_PORT -database $DATABASE $BACKUP_DIR

    # Check if the backup was successful
    if [ -d "$BACKUP_DIR/$DATABASE" ]; then
        # Create tar.gz archive
        tar czf $BACKUP_FILE -C $BACKUP_DIR $DATABASE

        # Remove temporary backup directory
        rm -rf "$BACKUP_DIR/$DATABASE"

        # Check if the backup file was created
        if [ -f $BACKUP_FILE ]; then
            echo "Backup of '$DATABASE' database created successfully: $BACKUP_FILE"
        else
            echo "Error creating backup for '$DATABASE' database."
        fi
    else
        echo "Error: '$DATABASE' database not found or unable to create backup."
    fi
done

# Remove old backups
find $BACKUP_DIR -type f -name 'influxdb_backup_*.tar.gz' -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Old backups older than $RETENTION_DAYS days have been removed."
