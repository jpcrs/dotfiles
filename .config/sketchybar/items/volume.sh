sketchybar --add  event   volume_change                                                 \
           --add  item    volume right                                                  \
           --set  volume         icon.padding_right=$DATA_ICON_PADDING_RIGHT            \
                                 icon.padding_left=$DATA_ICON_PADDING_LEFT              \
                                 icon.color=$BAR_BLUE                                   \
                                 \
                                 label.color=$BAR_BLUE                                  \
                                 label.padding_right=$DATA_LABEL_PADDING_RIGHT          \
                                 \
                                 background.padding_left=$DATA_BACKGROUND_PADDING_LEFT  \
                                 background.border_color=$BAR_BACKGROUND                \
                                 background.border_width=1                              \
                                 background.corner_radius=6                             \
                                 background.drawing=on                                  \
                                 \
                                 script="$PLUGIN_DIR/volume.sh"                         \
                                 update_freq=30                                         \
           --subscribe volume    volume_change mouse.entered mouse.exited mouse.clicked