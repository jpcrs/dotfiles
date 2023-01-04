#!/bin/bash
source "$HOME/.config/sketchybar/icons.sh"

ICON="$ICON_BATTERY_FULL"
LABEL="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ ${CHARGING} != "" ]]; then
  PREFIX="_CHARGING"
else
  PREFIX=""
fi

case ${LABEL} in
  100) ICON="$ICON_BATTERY_FULL${PREFIX}" ;;
  9[0-9]) ICON="$ICON_BATTERY_90${PREFIX}" ;;
  8[0-9]) ICON="$ICON_BATTERY_80${PREFIX}" ;;
  7[0-9]) ICON="$ICON_BATTERY_70${PREFIX}" ;;
  6[0-9]) ICON="$ICON_BATTERY_60${PREFIX}" ;;
  5[0-9]) ICON="$ICON_BATTERY_50${PREFIX}" ;;
  4[0-9]) ICON="$ICON_BATTERY_40${PREFIX}" ;;
  3[0-9]) ICON="$ICON_BATTERY_30${PREFIX}" ;;
  2[0-9]) ICON="$ICON_BATTERY_20${PREFIX}" ;;
  1[0-9]) ICON="$ICON_BATTERY_10${PREFIX}" ;;
  *) ICON="$ICON_BATTERY_10${PREFIX}"
esac

sketchybar --set $NAME icon="$ICON" label="$LABEL%"