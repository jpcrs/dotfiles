sketchybar --add item     calendar right                                                  \
           --set calendar          icon.padding_right=$DATA_ICON_PADDING_RIGHT            \
                                   icon.padding_left=$DATA_ICON_PADDING_LEFT              \
                                   icon.color=$BAR_ACQUA                                  \
                                   \
                                   label.color=$BAR_ACQUA                                 \
                                   label.padding_right=$DATA_LABEL_PADDING_RIGHT          \
                                   \
                                   background.padding_left=$DATA_BACKGROUND_PADDING_LEFT  \
                                   background.border_color=$BAR_BACKGROUND                \
                                   background.border_width=1                              \
                                   background.corner_radius=6                             \
                                   background.drawing=on                                  \
                                   \
                                   script="$PLUGIN_DIR/calendar.sh"                       \
                                   update_freq=30                                         \
           --subscribe  calendar   mouse.entered mouse.exited mouse.clicked