#!/bin/bash
# InfluxDB Backup Script
#
# This script creates backups of specified InfluxDB databases and retains them
# based on the specified retention period. You can configure multiple databases
# by adding them to the DATABASES array.

# Include configuration variables
source config.sh

# Get current timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Create backup directory if it doesn't exist
if [ ! -d $BACKUP_DIR ]; then
    mkdir -p $BACKUP_DIR
fi

# Iterate through each bucket and create backup
for BUCKET in "${INFLUXDB_BUCKET[@]}"; do
    # Backup file name
    BACKUP_FILE="$BACKUP_DIR/influxdb_backup_${BUCKET}_${TIMESTAMP}"

    # Perform InfluxDB backup
    influx backup -t $INFLUXDB_TOKEN -o $INFLUXDB_ORG -b $BUCKET $BACKUP_FILE

    # Check if the backup was successful
    if [ -d "$BACKUP_FILE" ]; then
        echo "Backup for '$BUCKET' successful. Backup files are stored in: $BACKUP_FILE"
    else
        echo "Error creating backup for '$BUCKET'."
    fi
done

# Remove old backups
find $BACKUP_DIR -type d -mtime +$RETENTION_DAYS -exec rm -rf {} \;

echo "Old backups older than $RETENTION_DAYS days have been removed."
