#!/bin/sh

# Terminate already running polybar instances
killall -q polybar

# Wait for them to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar, using default config
polybar example &

echo "Polybar launched..."
