#!/bin/bash

# Ambil CPU
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2f", usage}')

# Ambil Memory
MEM=$(free -m | awk '/Mem:/ {printf "%.2f", ($3/$2)*100}')

# Ambil Disk
DISK=$(df -h / | awk 'NR==2 {print $5}')

# Print ke terminal
echo "CPU Usage : $CPU%"
echo "Memory    : $MEM%"
echo "Disk      : $DISK"

# Simpan log
mkdir -p logs
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
echo -e "CPU: $CPU%\nMEM: $MEM%\nDISK: $DISK" > logs/report-$TIMESTAMP.log

echo "Report saved to logs/report-$TIMESTAMP.log"
