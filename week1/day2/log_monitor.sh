#!/bin/bash

LOG_FILE="/var/log/syslog"	# change to any log file you want
KEYWORD="error"
ALRET_EMAIL="gangavarapuvenkatesh3@gmail.com"

echo "Monitoring #LOG_FILE for '$KEYWORD'..."

tail -Fn0 $LOG_FILE | \
while read line; do
    echo "$line" | grep -i "$KEYWORD" >/dev/null
    if [ $? = 0 ]; then
        echo "[ALERT] Found '$KEYWORD': $line"
	echo "Error found: $line" | mail -s "Log Alert: $KEYWORD detected" $ALERT_EMAIL
    fi
done

