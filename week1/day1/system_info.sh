#!/bin/bash

echo "========== SYSTEM INFORMATION =========="
echo "Hostname : $(hostname)"
echo "Uptime : $(uptime p)"
echo "Current Users : $(who | wc -l)"
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h /
echo "Top 5 Memory Using Processess:"
ps aux --sort=-%mem | head -6

