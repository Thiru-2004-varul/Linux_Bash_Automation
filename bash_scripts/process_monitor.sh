#!/bin/bash
echo "Top 5 processes by memory usage:"
ps aux --sort=-%mem | head -n 6
echo "Top 5 processes by CPU usage:"
ps aux --sort=-%cpu | head -n 6

