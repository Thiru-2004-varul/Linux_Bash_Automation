#!/bin/bash
LOGFILE="/var/log/syslog"
LINES=20

echo "Showing last $LINES lines of $LOGFILE"
tail -n $LINES $LOGFILE

