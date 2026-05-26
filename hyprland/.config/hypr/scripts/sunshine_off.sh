#!/bin/bash

MON1="DP-1"
MON2="DP-2"

# Turn monitor back on (you may want to change these options)
hyprctl dispatch "hl.monitor({output=\"$MON1\", disabled=false})"
hyprctl dispatch "hl.monitor({output=\"$MON2\", disabled=false})"

# Get name of headless display
HEADLESS=$(hyprctl -j monitors | jq -r '.[] | select(.name | test("HEADLESS-"; "i")).name')

# Remove headless virtual display
hyprctl output remove "$HEADLESS"
