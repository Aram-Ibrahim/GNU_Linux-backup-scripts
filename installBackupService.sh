#!/bin/bash
sudo chown root:root -R ./etc
sudo chmod 644 -R ./etc
sudo chown root:root backup.sh restore.sh
sudo chmod 755 backup.sh restore.sh
sudo cp backup.sh restore.sh /usr/bin
sudo cp -r ./etc /etc
sudo systemctl daemon-reload
sudo systemctl enable backup.timer
sudo systemctl start backup.timer
