#!/bin/bash

# Check if 'asusctl' command exists
if ! command -v asusctl &> /dev/null; then
    exit 1
fi

# Array of zone-color pairs
declare -A aura_colors=(
    [4]="aa00ff"
    [3]="00ffc9"
    [2]="a2ff00"
    [1]="ff7c0f"
)

# Loop through zones and set color
for zone in "${!aura_colors[@]}"; do
    color="${aura_colors[$zone]}"
    echo "Setting zone $zone to color #$color..."
    asusctl aura static -z "$zone" -c "$color"
done
