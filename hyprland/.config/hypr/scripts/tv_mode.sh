#!/bin/bash

TV="HDMI-A-1"
MON1="DP-1"
MON2="DP-2"

TV_AUDIO="203"
DESK_AUDIO="149"

if hyprctl monitors | grep -q "$TV"; then
  # =====================
  # 🖥 DESK MODE
  # =====================

  # Monitor (disable TV)
  hyprctl dispatch "hl.monitor({output=\"$TV\", disabled=true})"

  # Enable desk monitors
  hyprctl dispatch "hl.monitor({output=\"$MON1\", disabled=false})"
  hyprctl dispatch "hl.monitor({output=\"$MON2\", disabled=false})"

  # (optional positioning if your build supports it elsewhere)

  # 🔊 Audio → Ryzen speakers
  wpctl set-default "$DESK_AUDIO"

else
  # =====================
  # 📺 TV MODE
  # =====================

  # Enable TV
  hyprctl dispatch "hl.monitor({output=\"$TV\", disabled=false})"

  # Disable desk monitors
  hyprctl dispatch "hl.monitor({output=\"$MON1\", disabled=true})"
  hyprctl dispatch "hl.monitor({output=\"$MON2\", disabled=true})"

  # 🔊 Audio → HDMI TV
  pactl set-sink-port "$TV_AUDIO" hdmi-output-3
  sleep 1
  wpctl set-default "$TV_AUDIO"
fi
