#!/bin/bash
#
# SysDiag Tool - Linux System Diagnostics
# Optimized for LPIC-1 Demonstration
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/../config/sysdiag.conf"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    LOG_FILE="/tmp/sysdiag.log"
    CPU_THRESHOLD=80
    MEM_THRESHOLD=80
    DISK_THRESHOLD=90
fi

show_header() {
    echo "=================================================="
    echo "         LINUX SYSTEM DIAGNOSTIC TOOL             "
    echo "         Date: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "         Hostname: $(hostname)"
    echo "=================================================="
}

get_cpu_usage() {
    local cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed "s/., *\([0-9.]\)%* id.*/\1/" | awk '{print int($1)}')
    local cpu_usage=$((100 - cpu_idle))
    echo "[CPU] Current Usage: ${cpu_usage}%"
}

get_mem_usage() {
    local mem_total=$(free -m | awk '/Mem:/ {print $2}')
    local mem_used=$(free -m | awk '/Mem:/ {print $3}')
    local mem_perc=$((mem_used * 100 / mem_total))
    echo "[MEM] Memory Usage: ${mem_perc}% (${mem_used}MB / ${mem_total}MB)"
}

get_disk_usage() {
    local disk_perc=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    echo "[DISK] Root Partition Usage: ${disk_perc}%"
}

get_top_processes() {
    echo -e "\n--- Top 5 CPU Consuming Processes ---"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

show_header
get_cpu_usage
get_mem_usage
get_disk_usage
get_top_processes
