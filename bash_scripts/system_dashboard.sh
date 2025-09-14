#!/usr/bin/env bash
# system_dashboard.sh - produces a timestamped system report
set -euo pipefail

OUTDIR="${HOME}/sys_reports"
mkdir -p "$OUTDIR"
TIMESTAMP=$(date '+%F_%H%M%S')
OUTFILE="$OUTDIR/system_dashboard_$TIMESTAMP.txt"

{
  echo "=== System Dashboard: $TIMESTAMP ==="
  hostname
  date
  echo "-- Uptime --"
  uptime -p
  echo "-- Top processes by memory --"
  ps aux --sort=-%mem | head -n 7
  echo "-- Disk usage --"
  df -h | grep '^/dev/' || df -h
  echo "-- Last 20 lines of syslog --"
  if [ -f /var/log/syslog ]; then tail -n 20 /var/log/syslog; elif [ -f /var/log/messages ]; then tail -n 20 /var/log/messages; else echo "(no syslog)"; fi
  echo "=== End ==="
} > "$OUTFILE"

# rotate keep last 30
ls -1tr "$OUTDIR"/system_dashboard_*.txt 2>/dev/null | head -n -30 | xargs -r rm -f

echo "Report saved to: $OUTFILE"

