#!/bin/bash

#free memory section w/date header
echo "Free Memory Report generated on: $(date)" > ~/backups/freemem/free_mem.txt
free -h >> ~/backups/freemem/free_mem.txt

#disk usage + date header
#using du here instead of dh as it give specific information about each folder
echo "Disk Usage Report generated on: $(date)" > ~/backups/diskuse/disk_usage.txt
du -h >> ~/backups/diskuse/disk_usage.txt

#using -h to clean up the displayed units

#list all open files
echo "Listing all current open files from timestamp: $(date)" > ~/backups/openlist/open_list.txt
lsof >> ~/backups/openlist/open_list.txt

#system disk space stats
echo "Disk Space Statistics generated on: $(date)" > ~/backups/freedisk/free_disk.txt
df -h >> ~/backups/freedisk/free_disk.txt

#edit: added headers to each of the sections so that whoever views the .txt files know when the when the reports were generated
