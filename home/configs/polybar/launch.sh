#!/usr/bin/env bash
# ~/.config/polybar/launch.sh

# Termina barras si ya hay corriendo
killall -q polybar

# Espera a que terminen
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza la barra
polybar main --config=$HOME/.config/polybar/config.ini &
