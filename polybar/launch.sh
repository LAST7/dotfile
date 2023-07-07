#!/bin/zsh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

# For multiple monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mybar &
done

echo "Polybar launched..."
