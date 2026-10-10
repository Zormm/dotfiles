#!/bin/bash

SINK="alsa_output.pci-0000_13_00.6.analog-stereo"
A="analog-output-lineout"
B="analog-output-headphones"

CURRENT=$(pactl list sinks | awk -v sink="$SINK" '
    $1 == "Name:" { found = ($2 == sink) }
    found && $1 == "Active" && $2 == "Port:" {
        print $3
        exit
    }
')

if [[ "$CURRENT" == "$A" ]]; then
  pactl set-sink-port "$SINK" "$B" && echo "Headphones"
elif [[ "$CURRENT" == "$B" ]]; then
  pactl set-sink-port "$SINK" "$A" && echo "Speaker"
else
  exit 1
fi
