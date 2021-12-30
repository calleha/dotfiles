#!/bin/bash
sudo rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.cache/*","/home/*/GDrive/*","/home/*/.thumbnails/*","/home/*/.local/share/Trash/*","/home/lost+found","/var/lib/dhcpcd/*"} / /mnt/2TB-SSD/rsyncbackup/
