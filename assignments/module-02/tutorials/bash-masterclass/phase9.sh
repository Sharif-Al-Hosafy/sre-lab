#!/usr/bin/env bash

if [[ ! -e "/tmp/app.log" ]]; then
    echo "creating log file..."
    cat <<EOF > /tmp/app.log
ERROR: disk full on /dev/sda1
INFO: backup completed
ERROR: connection timeout to db-01
WARNING: memory usage at 85%
INFO: health check passed
EOF
    echo "done"
fi

errs=$(grep "ERROR" /tmp/app.log)
echo "$errs"
echo "$errs" | awk 'NR==2 {print $2}' 
echo "$errs" | sed "s/ERROR/CRITICAL/" 