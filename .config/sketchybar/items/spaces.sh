#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/plugins/space.sh"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13")

sketchybar --add  item                 spaces.left.spacer left \
           --set  spaces.left.spacer   width=20

spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  sketchybar --add space               space.$sid left                                \
             --set space.$sid          associated_space=$sid                          \
                                       \
                                       icon=${SPACE_ICONS[i]}                         \
                                       icon.font="$FONT:Bold:11.0"      \
                                       icon.highlight_color=$BAR_ACTIVE_ICON          \
                                       icon.color=$BAR_INACTIVE_ICON                  \
                                       icon.y_offset=4                                \
                                       \
                                       label.font="sketchybar-app-font:Regular:11.0"  \
                                       label.color=$BAR_ACTIVE_ICON                   \
                                       label.padding_right=12                         \
                                       \
                                       background.padding_left=2                      \
                                       background.padding_right=2                     \
                                       background.corner_radius=6                     \
                                       background.drawing=on                          \
                                       \
                                       script="$PLUGIN_DIR/space.sh"
done

sketchybar --add       event        refresh_current_workspace     \
           --add       event        refresh_workspaces            \
           --add       item         system.yabai left             \
           --set       system.yabai script="$PLUGIN_DIR/space.sh" \
                                    drawing=off                   \
                                    associated_display=active     \
           --subscribe system.yabai refresh_current_workspace     \
                                    refresh_workspaces

sketchybar --add  item                 spaces.right.spacer left                      \
           --set  spaces.right.spacer  width=10

sketchybar --add  bracket     spaces   spaces.left.spacer                            \
                                       '/space\..*/'                                 \
                                       spaces.right.spacer                           \
           --set  spaces               background.color=$BAR_BACKGROUND              \
                                       background.corner_radius=4                    \
                                       background.height=32                          \
                                       background.y_offset=5

refresh_workspaces