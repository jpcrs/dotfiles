sketchybar --add item      wattage  right                                                  \
           --set wattage            icon="$ICON_BOLT"                                      \
                                    icon.padding_right=$DATA_ICON_PADDING_RIGHT            \
                                    icon.padding_left=$DATA_ICON_PADDING_LEFT              \
                                    icon.color=$BAR_RED                                    \
                                    \
                                    label.color=$BAR_RED                                   \
                                    label.padding_right=$DATA_LABEL_PADDING_RIGHT          \
                                    \
                                    background.padding_left=$DATA_BACKGROUND_PADDING_LEFT  \
                                    \
                                    mach_helper="$HELPER"                                  \
                                    update_freq=3