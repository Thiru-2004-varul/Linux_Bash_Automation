#!/bin/bash
echo "System Information"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Logged in users: $(who)"
echo "Memory usage: $(free -h)"

