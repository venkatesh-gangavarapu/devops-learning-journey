#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | '{print 100 -$8"%"}')
MEM=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n",$3,$2.$3*100/$2}')
DISK=$(df -h / | awk 'NR==2{print $3"/"$2" ("$5")"}')

echo "========== SYSTEM MONITOR =========="
echo "CPU Usage: $CPU"
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"
echo "Timestamp: $(date)"
echo "===================================="

