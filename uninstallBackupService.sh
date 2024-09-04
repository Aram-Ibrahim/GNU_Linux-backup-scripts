#!/bin/bash
sudo systemctl disable backup.timer
sudo rm /usr/bin/backup.sh /usr/bin/restore.sh 
sudo rm -rf  /etc/systemd/system/backup.service /etc/systemd/system/backup.timer
sudo systemctl daemon-reload
