#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

update() {
  ICON="$VOLUME_HIGH"
  LABEL=$(osascript -e "get volume settings" | cut -d " " -d ":" -f2 | cut -d "," -f1)
  MUTED="$(osascript -e "get volume settings" | cut -d ',' -f 4 | cut -d ':' -f 2)"

  if [[ ! ${LABEL} -gt 30 ]]; then
    ICON="$VOLUME_MEDIUM"
  fi

  if [[ ${MUTED} == true ]]; then
    ICON="$VOLUME_MUTED"
  fi

  sketchybar --set $NAME icon="$ICON" label="$LABEL%"
}

add_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_BLUE
}

remove_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_BACKGROUND
}

mouse_clicked() {
  MUTED="$(osascript -e "get volume settings" | cut -d ',' -f 4 | cut -d ':' -f 2)"
  if [[ ${MUTED} == true ]]; then
    osascript -e 'set volume output muted false'
  else
    osascript -e 'set volume output muted true'
  fi
  update
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") add_hover
  ;;
  "mouse.exited") remove_hover
  ;;
  *) update
  ;;
esac