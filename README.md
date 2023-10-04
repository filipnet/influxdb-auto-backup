# influxdb-auto-backup
Automate your InfluxDB backups with this simple Bash script. This script allows you to schedule regular backups for multiple InfluxDB databases, providing a convenient way to safeguard your data. You can customize backup settings, including the retention period for your backups.

## Features

- **Automated Backups:** Schedule automated backups for one or more InfluxDB databases.
- **Custom Retention:** Set a retention period to manage how long your backups are kept.
- **Easy Configuration:** Configure your InfluxDB server details and backup settings in one place.
- **Portable Backups:** The script creates portable and compressed backup files for easy storage and transfer.

## Usage

1. **Clone the Repository:** ```git clone filipnet/influxdb-auto-backup```
2. **Navigate to the Repository:** ```cd influxdb-auto-backup```
3. **Configure the Script:**
Open `backup-script.sh` in a text editor and configure the following variables:
- `INFLUXDB_HOST`: Hostname or IP address of your InfluxDB server.
- `INFLUXDB_PORT`: Port number of your InfluxDB server.
- `BACKUP_DIR`: Directory to store your backup files.
- `RETENTION_DAYS`: Number of days to retain your backups.
4. **Run the Script:** ```./backup-script.sh```
5. **Verify Backups:** ```Check the specified `BACKUP_DIR` to ensure that your backups have been created successfully.```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.
