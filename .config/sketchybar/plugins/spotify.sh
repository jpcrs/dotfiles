#!/bin/sh
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

next ()
{
  osascript -e 'tell application "Spotify" to play next track'
}

back () 
{
  osascript -e 'tell application "Spotify" to play previous track'
}

play () 
{
  osascript -e 'tell application "Spotify" to playpause'
}

repeat () 
{
  REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
  if [ "$REPEAT" = "false" ]; then
    sketchybar -m --set spotify.repeat icon.highlight=on
    osascript -e 'tell application "Spotify" to set repeating to true'
  else 
    sketchybar -m --set spotify.repeat icon.highlight=off
    osascript -e 'tell application "Spotify" to set repeating to false'
  fi
}

shuffle () 
{
  SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
  if [ "$SHUFFLE" = "false" ]; then
    sketchybar -m --set spotify.shuffle icon.highlight=on
    osascript -e 'tell application "Spotify" to set shuffling to true'
  else 
    sketchybar -m --set spotify.shuffle icon.highlight=off
    osascript -e 'tell application "Spotify" to set shuffling to false'
  fi
}

update ()
{
  PLAYING=1
  if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
    PLAYING=0
    TRACK="$(echo "$INFO" | jq -r .Name | sed 's/\(.\{19\}\).*/\1.../')"
    ARTIST="$(echo "$INFO" | jq -r .Artist | sed 's/\(.\{20\}\).*/\1.../')"
    ALBUM="$(echo "$INFO" | jq -r .Album | sed 's/\(.\{20\}\).*/\1.../')"
    SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
    REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
    COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
    LABEL_TITLE="$(echo $(echo "$INFO" | jq -r .Artist) - $(echo "$INFO" | jq -r .Name) | sed 's/\(.\{26\}\).*/\1.../')"
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
    if [ "$ARTIST" == "" ]; then
      args+=(--set spotify.title label="$TRACK" drawing=on \
             --set spotify.album label="Podcast" drawing=on \
             --set spotify.artist label="$ALBUM" drawing=on  )
    else
      args+=(--set spotify.anchor icon=$ICON_SPOTIFY label="$LABEL_TITLE" \
             --set spotify.title label="$TRACK" drawing=on \
             --set spotify.album label="$ALBUM" drawing=on \
             --set spotify.artist label="$ARTIST" drawing=on)
    fi

                                                         \
    args+=(--set spotify.play icon=􀊆 icon.padding_left=4 icon.padding_right=5 \
           --set spotify.shuffle icon.highlight=$SHUFFLE \
           --set spotify.repeat icon.highlight=$REPEAT \
           --set spotify.cover background.image="/tmp/cover.jpg" \
                               background.color=0x00000000 \
           --set spotify.anchor drawing=on \
           --set spotify drawing=on                               )
  else
    args+=(--set spotify.title drawing=on \
           --set spotify.artist drawing=on \
           --set spotify.anchor icon="$ICON_SPOTIFY_PAUSE_BAR" drawing=on popup.drawing=off \
           --set spotify.play icon=􀊄 icon.padding_left=6 icon.padding_right=3                           )
  fi
  sketchybar -m "${args[@]}"
}

mouse_clicked () {
  case "$NAME" in
    "spotify.next") next
    ;;
    "spotify.back") back
    ;;
    "spotify.play") play
    ;;
    "spotify.shuffle") shuffle
    ;;
    "spotify.repeat") repeat
    ;;
    *) exit
    ;;
  esac
}

popup () {
  sketchybar --set spotify.anchor popup.drawing=$1
}

add_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_GREEN
}

remove_hover() {
    sketchybar --animate linear 10 --set $NAME background.border_color=$BAR_BACKGROUND
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") add_hover
  ;;
  "mouse.exited") remove_hover
  ;;
  "mouse.exited.global") popup off
  ;;
  *) update
  ;;
esac