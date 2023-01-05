#!/bin/bash
source "$HOME/.config/sketchybar/icons.sh"

ICON="$ICON_BATTERY_FULL"
LABEL="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ ${CHARGING} != "" ]]; then
 case ${LABEL} in
  100) ICON="$ICON_BATTERY_FULL_CHARGING" ;;
  9[0-9]) ICON="$ICON_BATTERY_90_CHARGING" ;;
  8[0-9]) ICON="$ICON_BATTERY_80_CHARGING" ;;
  7[0-9]) ICON="$ICON_BATTERY_70_CHARGING" ;;
  6[0-9]) ICON="$ICON_BATTERY_60_CHARGING" ;;
  5[0-9]) ICON="$ICON_BATTERY_50_CHARGING" ;;
  4[0-9]) ICON="$ICON_BATTERY_40_CHARGING" ;;
  3[0-9]) ICON="$ICON_BATTERY_30_CHARGING" ;;
  2[0-9]) ICON="$ICON_BATTERY_20_CHARGING" ;;
  1[0-9]) ICON="$ICON_BATTERY_10_CHARGING" ;;
  *) ICON="$ICON_BATTERY_10_CHARGING"
 esac
else
 case ${LABEL} in
  100) ICON="$ICON_BATTERY_FULL" ;;
  9[0-9]) ICON="$ICON_BATTERY_90" ;;
  8[0-9]) ICON="$ICON_BATTERY_80" ;;
  7[0-9]) ICON="$ICON_BATTERY_70" ;;
  6[0-9]) ICON="$ICON_BATTERY_60" ;;
  5[0-9]) ICON="$ICON_BATTERY_50" ;;
  4[0-9]) ICON="$ICON_BATTERY_40" ;;
  3[0-9]) ICON="$ICON_BATTERY_30" ;;
  2[0-9]) ICON="$ICON_BATTERY_20" ;;
  1[0-9]) ICON="$ICON_BATTERY_10" ;;
  *) ICON="$ICON_BATTERY_10"
 esac
fi


sketchybar --set $NAME icon="$ICON" label="$LABEL%"