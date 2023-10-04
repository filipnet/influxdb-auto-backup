# influxdb-auto-backup
Automate your InfluxDB backups with this simple Bash script. This script allows you to schedule regular backups for multiple InfluxDB databases, providing a convenient way to safeguard your data. You can customize backup settings, including the retention period for your backups.

## Features

- **Automated Backups:** Schedule automated backups for one or more InfluxDB databases.
- **Custom Retention:** Set a retention period to manage how long your backups are kept.
- **Easy Configuration:** Configure your InfluxDB server details and backup settings in one place.
- **Portable Backups:** The script creates portable and compressed backup files for easy storage and transfer.

## Usage

1. **Clone the Repository:** ```git clone https://github.com/filipnet/influxdb-auto-backup.git```
2. **Navigate to the Repository:** ```cd influxdb-auto-backup```
3. **Configure the Script:** - see the [Configuration] file for details.
4. **Run the Script:** ```./backup-script.sh```
5. **Verify Backups:** ```Check the specified `BACKUP_DIR` to ensure that your backups have been created successfully.```

## Configuration
Create config.sh
Before running the backup script, you need to create a config.sh file with your InfluxDB server details and backup settings. Here's how you can create the configuration file using the provided example:

- Navigate to the Repository: ```cd influxdb-auto-backup```
- Rename ```config.sh.example``` to ```config.sh``` and open it in a text editor.
- Edit Configuration Variables:
Update the following variables in config.sh with your InfluxDB server details and backup settings:
```
#!/bin/bash

# InfluxDB Settings
INFLUXDB_TOKEN="your_influxdb_token"
INFLUXDB_ORG="your_influxdb_org"
BUCKETS=("bucket1" "bucket2" "bucket3")  # List of buckets to be backed up

# Backup Settings
BACKUP_DIR="/path/to/backup/directory"
RETENTION_DAYS=7
```

Make sure to replace "your_influxdb_token", "your_influxdb_org", and the bucket names with your actual InfluxDB authentication token, organization name, and bucket names respectively.

## Schedule Automated Backups using /etc/crontab:

Open /etc/crontab in a text editor as root: ```sudo nano /etc/crontab```
Add the following line to schedule the backup script daily at 2:00 AM and redirect the output to /dev/null to suppress any messages:
```
0 2 * * * root /root/influxdb-auto-backup/influxdb-auto-backup.sh > /dev/null 2>&1
```
Make sure to replace /root/influxdb-auto-backup/influxdb-auto-backup.sh with the actual path to your backup-script.sh file.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.
