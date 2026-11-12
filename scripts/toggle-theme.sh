#!/bin/sh
# Toggle between themes/light.conf and themes/dark.conf, then reload kitty's config.
cfg="${KITTY_CONFIG_DIRECTORY:-$HOME/.config/kitty}"
if grep -q 'light' "$cfg/current-theme.conf"; then
  echo 'include themes/dark.conf' > "$cfg/current-theme.conf"
else
  echo 'include themes/light.conf' > "$cfg/current-theme.conf"
fi
# SIGUSR1 makes kitty reload its config (no remote control needed)
kill -USR1 "$KITTY_PID"
