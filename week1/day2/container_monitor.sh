#!/bin/bash

echo "========== CONTAINER MONITOR =========="

containers=$(docker ps --format "{{.Names}}")

if [ -z "$containers" ]; then
    echo "No running containers."
    exit 0
fi

for c in $containers; do
    cpu=$(docker stats $c --no-stream --format "{{.CPUPerc}}")
    mem=$(docker stats $c --no-stream --format "{{.MemPerc}}")
    echo "Containers: $c CPU: $cpu Memory: $mem"
done

