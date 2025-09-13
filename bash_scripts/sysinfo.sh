#!/bin/bash
echo "System Report for $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Users Logged In: $(who | wc -l)"
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h | grep '^/dev/'

