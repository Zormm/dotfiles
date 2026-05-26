#!/bin/bash

MON1="DP-1"
MON2="DP-2"

# Create headless virtual display
hyprctl output create headless

# Disable the monitor
hyprctl dispatch "hl.monitor({output=\"$MON1\", disabled=true})"
hyprctl dispatch "hl.monitor({output=\"$MON2\", disabled=true})"
