#!/bin/bash
# Color-coded load average script for tmux status bar

load=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')

# Use darker background colors for better eye comfort
if (( $(echo "$load < 0.25" | bc -l) )); then
    echo "#[fg=colour235,bg=colour22] $load"  # Dark green background, one space
elif (( $(echo "$load < 0.75" | bc -l) )); then
    echo "#[fg=colour235,bg=colour58] $load"  # Dark yellow background, one space
else
    echo "#[fg=colour235,bg=colour52] $load"  # Dark red background, one space
fi
