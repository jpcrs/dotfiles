sketchybar --add item     clock  right                                                  \
           --set clock           icon.padding_right=$DATA_ICON_PADDING_RIGHT            \
                                 icon.padding_left=$DATA_ICON_PADDING_LEFT              \
                                 icon.color=$BAR_YELLOW                                 \
                                 \
                                 label.width=48                                         \
                                 label.color=$BAR_YELLOW                                \
                                 label.padding_right=$DATA_LABEL_PADDING_RIGHT          \
                                 \
                                 background.padding_left=$DATA_BACKGROUND_PADDING_LEFT  \
                                 \
                                 script="$PLUGIN_DIR/clock.sh"                          \
                                 update_freq=1