#!/bin/bash
# Color-coded memory usage script for tmux status bar

mem=$(free | grep Mem | awk '{printf("%.1f", $3/$2 * 100.0)}')

# Use darker background colors for better eye comfort
if (( $(echo "$mem < 30" | bc -l) )); then
    echo "#[fg=colour235,bg=colour22] $mem% "  # Dark green background
elif (( $(echo "$mem < 75" | bc -l) )); then
    echo "#[fg=colour235,bg=colour58] $mem% "  # Dark yellow background
else
    echo "#[fg=colour235,bg=colour52] $mem% "  # Dark red background
fi
