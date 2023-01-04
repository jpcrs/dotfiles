source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

sketchybar --add bracket data clock calendar volume battery cpu.usage wattage spotify.anchor data_right_spacer               \
           --set         data background.color=$BAR_BACKGROUND \
                               background.corner_radius=4                    \
                               background.height=32                          \
                               background.y_offset=5