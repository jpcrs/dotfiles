source "$HOME/.config/sketchybar/colors.sh"

add_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_ORANGE
}

remove_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_BACKGROUND
}

mouse_clicked() {
    open -a alacritty --args -e btop
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") add_hover
  ;;
  "mouse.exited") remove_hover
  ;;
esac