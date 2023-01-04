sketchybar --add  item      battery right                                          \
           --set  battery   icon.padding_right=$DATA_ICON_PADDING_RIGHT            \
                            icon.padding_left=$DATA_ICON_PADDING_LEFT              \
                            icon.color=$BAR_PINK                                   \
                            \
                            label.color=$BAR_PINK                                  \
                            label.padding_right=$DATA_LABEL_PADDING_RIGHT          \
                            \
                            background.padding_left=$DATA_BACKGROUND_PADDING_LEFT  \
                            \
                            script="$PLUGIN_DIR/battery.sh"                        \
                            update_freq=3
