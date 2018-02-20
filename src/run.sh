#!/bin/sh
echo "* * * * * /usr/bin/rclone sync "$REMOTE":"$REMOTE_PATH" /data" > rclone_cron

crontab rclone_cron

crond -f
