#!/bin/sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/state.sh"

activate_space() {
if [ -z "${SID+x}" ] || [ -z "${SID}" ] || [ -z "${NAME+x}" ] || [ -z "${NAME}" ]; then
  return
fi
if [ "$(hget spaces $SID)" = "true" ]; then
  sketchybar --set  $NAME     icon.highlight=true                       \
                              icon.padding_left=5                       \
                              icon.padding_right=-2                     \
                              \
                              label.color=$BAR_ACTIVE_ICON              \
                              label.width="dynamic"                     \
                              \
                              background.border_width=1                 \
                              background.border_color=$BAR_ACTIVE_ICON  \
                              drawing=on
else
  sketchybar --set  $NAME     icon.highlight=true                       \
                              icon.padding_left=7                       \
                              icon.padding_right=-6                     \
                              \
                              label.color=$BAR_ACTIVE_ICON              \
                              label.width="dynamic"                     \
                              \
                              background.border_width=1                 \
                              background.border_color=$BAR_ACTIVE_ICON  \
                              drawing=on
fi
}

deactivate_space() {
if [ -z "${SID+x}" ] || [ -z "${SID}" ] || [ -z "${NAME+x}" ] || [ -z "${NAME}" ]; then
  return
fi

if [ "$(hget spaces $SID)" = "true" ]; then
  sketchybar --set   $NAME    icon.highlight=false            \
                              icon.padding_left=5             \
                              icon.padding_right=-2           \
                              \
                              label.color=$BAR_INACTIVE_ICON  \
                              label.width="dynamic"           \
                              \
                              background.border_width=0       \
                              drawing=on
else
  sketchybar --set  $NAME     icon.highlight=false            \
                              \
                              label.color=$BAR_INACTIVE_ICON  \
                              label.width="dynamic"           \
                              \
                              background.border_width=0       \
                              drawing=off
fi
}

refresh_current_workspace() {
  current_space=${2:-$(yabai -m query --spaces --space | jq .index)}
  args=()

  while read -r line; do
    for space in $line; do
      icon_strip=" "
      apps="$(yabai -m query --windows --space $space | jq -r '.[] | select(.["is-minimized"] == false) | .app')"
      if [ "$apps" ]; then
        while IFS= read -r app; do
          icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
        done <<< "$apps"
        args+=(--set space.$space label="$icon_strip" drawing=on icon.padding_left=5 icon.padding_right=-2)
        hput spaces "$space" true
      else
        args+=(--set space.$space label="$icon_strip" drawing=on icon.padding_left=7 icon.padding_right=-6)
        hput spaces "$space" false
      fi
    done
  done <<< "$current_space"

  sketchybar -m "${args[@]}"
}

refresh_workspaces() {
  current_spaces=${WORKSPACES:-$(yabai -m query --displays | jq -r '.[].spaces | @sh')}
  current_space=${CURRENT:-$(yabai -m query --spaces --space | jq .index)}
  args=()
  if [ "$FORCE_CURRENT" = "true" ]; then
    current_spaces+=" $current_space"
  fi

  while read -r line; do
    for space in $line; do
      icon_strip=" "
      apps="$(yabai -m query --windows --space $space | jq -r '.[] | select(.["is-minimized"] == false) | .app')"
      if [ "$apps" ]; then
        while IFS= read -r app; do
          icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
        done <<< "$apps"
        args+=(--set space.$space label="$icon_strip" drawing=on icon.padding_left=5 icon.padding_right=-2)
        hput spaces "$space" true
      else
        if [ "$current_space" = "$space" ]; then
          args+=(--set space.$space label="$icon_strip" drawing=on icon.padding_left=7 icon.padding_right=-6)
        else
          args+=(--set space.$space label="$icon_strip" drawing=off icon.padding_left=7 icon.padding_right=-6)
        fi
        hput spaces "$space" false
      fi
    done
  done <<< "$current_spaces"

  sketchybar -m "${args[@]}"
}

case "$SENDER" in
  "refresh_current_workspace") refresh_current_workspace
    exit 0;
  ;;
  "refresh_workspaces") refresh_workspaces
    exit 0;
  ;;
esac

if [ "$SELECTED" = "true" ]; then
  activate_space
else
  deactivate_space
fi