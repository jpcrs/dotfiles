#!/usr/bin/env bash

## Dirs #############################################
polybar_path="$HOME/.config/polybar"
rofi_path="$HOME/.config/rofi"
terminal_path="$HOME/.config/alacritty"
geany_path="$HOME/.config/geany"
openbox_path="$HOME/.config/openbox"
dunst_path="$HOME/.config/dunst"

# wallpaper ---------------------------------
set_wall() {
	nitrogen --save --set-zoom-fill /usr/share/backgrounds/"$1"
}

# polybar ---------------------------------
change_bar() {
	sed -i -e "s/STYLE=.*/STYLE=\"$1\"/g" "$polybar_path"/launch.sh
	sed -i -e "s/font-0 = .*/font-0 = \"$2\"/g" "$polybar_path"/"$1"/config.ini
}

# rofi ---------------------------------
change_rofi() {		
	sed -i -e "s/STYLE=.*/STYLE=\"$1\"/g" "$rofi_path"/bin/mpd "$rofi_path"/bin/network "$rofi_path"/bin/screenshot
	sed -i -e "s/DIR=.*/DIR=\"$1\"/g" "$rofi_path"/bin/launcher "$rofi_path"/bin/powermenu
	sed -i -e 's/STYLE=.*/STYLE="launcher"/g' "$rofi_path"/bin/launcher
	sed -i -e 's/STYLE=.*/STYLE="powermenu"/g' "$rofi_path"/bin/powermenu
	sed -i -e "s/font:.*/font:				 	\"$2\";/g" "$rofi_path"/"$1"/font.rasi

	sed -i -e "s/font:.*/font:				 	\"$2\";/g" "$rofi_path"/dialogs/askpass.rasi "$rofi_path"/dialogs/confirm.rasi
	sed -i -e "s/border:.*/border:					$3;/g" "$rofi_path"/dialogs/askpass.rasi "$rofi_path"/dialogs/confirm.rasi

	sed -i -e "s/icon-theme:.*/icon-theme:         \"$4\";/g" "$rofi_path"/config.rasi

	cat > "$rofi_path"/dialogs/colors.rasi <<- _EOF_
	/* Color-Scheme */

	* {
	    BG:    #2E3440ff;
	    FG:    #E5E9F0ff;
	    BDR:   #81A1C1ff;
	}
	_EOF_
}

# network manager ---------------------------------
change_nm() {
	sed -i -e "s#dmenu_command = .*#dmenu_command = rofi -dmenu -theme $1/networkmenu.rasi#g" "$HOME"/.config/networkmanager-dmenu/config.ini
}

# terminal ---------------------------------
change_term() {
	sed -i "s/family: .*/family: \"$1\"/g" "$terminal_path"/fonts.yml
	sed -i "s/size: .*/size: $2/g" "$terminal_path"/fonts.yml

	cat > "$terminal_path"/colors.yml <<- _EOF_
		## Colors configuration
		colors:
		  # Default colors
		  primary:
		    background: '#333945'
		    foreground: '#D8DEE9'

		  # Normal colors
		  normal:
		    black:   '#3B4252'
		    red:     '#BF616A'
		    green:   '#A3BE8C'
		    yellow:  '#EBCB8B'
		    blue:    '#81A1C1'
		    magenta: '#B48EAD'
		    cyan:    '#88C0D0'
		    white:   '#E5E9F0'

		  # Bright colors
		  bright:
		    black:   '#4C566A'
		    red:     '#BF616A'
		    green:   '#A3BE8C'
		    yellow:  '#EBCB8B'
		    blue:    '#81A1C1'
		    magenta: '#B48EAD'
		    cyan:    '#8FBCBB'
		    white:   '#ECEFF4'
	_EOF_
}

# geany ---------------------------------
change_geany() {
	sed -i -e "s/color_scheme=.*/color_scheme=$1.conf/g" "$geany_path"/geany.conf
	sed -i -e "s/editor_font=.*/editor_font=$2/g" "$geany_path"/geany.conf
}

# gtk theme, icons and fonts ---------------------------------
change_gtk() {
	xfconf-query -c xsettings -p /Net/ThemeName -s "$1"
	xfconf-query -c xsettings -p /Net/IconThemeName -s "$2"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "$3"
	xfconf-query -c xsettings -p /Gtk/FontName -s "$4"
}

# openbox ---------------------------------
obconfig () {
	namespace="http://openbox.org/3.4/rc"
	config="$openbox_path/rc.xml"
	theme="$1"
	layout="$2"
	font="$3"
	fontsize="$4"

	# Theme
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:name' -v "$theme" "$config"

	# Title
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:titleLayout' -v "$layout" "$config"

	# Fonts
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:slant' -v Normal "$config"

	# Margins
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:top' -v 0 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:bottom' -v 15 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:left' -v 15 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:right' -v 15 "$config"
}

# dunst ---------------------------------
change_dunst() {
	sed -i -e "s/geometry = .*/geometry = \"$1\"/g" "$dunst_path"/dunstrc
	sed -i -e "s/font = .*/font = $2/g" "$dunst_path"/dunstrc
	sed -i -e "s/frame_width = .*/frame_width = $3/g" "$dunst_path"/dunstrc

	cat > "$dunst_path"/sid <<- _EOF_
		Dark
	_EOF_

	sed -i '/urgency_low/Q' "$dunst_path"/dunstrc
	cat >> "$dunst_path"/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 2
		background = "#2E3440"
		foreground = "#E5E9F0"
		frame_color = "#81A1C1"

		[urgency_normal]
		timeout = 5
		background = "#2E3440"
		foreground = "#E5E9F0"
		frame_color = "#81A1C1"

		[urgency_critical]
		timeout = 0
		background = "#2E3440"
		foreground = "#D46389"
		frame_color = "#D46389"
	_EOF_

	pkill dunst && dunst &
}

# Plank ---------------------------------
change_dock() {
	cat > "$HOME"/.cache/plank.conf <<- _EOF_
		[dock1]
		alignment='center'
		auto-pinning=true
		current-workspace-only=false
		dock-items=['xfce-settings-manager.dockitem', 'exo-file-manager.dockitem', 'alacritty.dockitem']
		hide-delay=0
		hide-mode='intelligent'
		icon-size=32
		items-alignment='center'
		lock-items=false
		monitor=''
		offset=0
		pinned-only=false
		position='bottom'
		pressure-reveal=false
		show-dock-item=false
		theme='Transparent'
		tooltips-enabled=true
		unhide-delay=0
		zoom-enabled=true
		zoom-percent=120
	_EOF_
}

# Other ---------------------------------
other_stuff() {
	sed -i -e "s/progressbar_color = .*/progressbar_color = \"$1\"/g" "$HOME"/.ncmpcpp/config
}

# notify ---------------------------------
notify_user () {
	local style=`basename $0` 
	dunstify -u normal --replace=699 -i /usr/share/icons/Archcraft/actions/24/channelmixer.svg "Applying Style : ${style%.*}"
}

## Execute Script -----------------------
notify_user

set_wall 'bg_9.jpg'																	# WALLPAPER

change_bar 'nordic' 'Iosevka Nerd Font:size=10;3' && "$polybar_path"/launch.sh		# STYLE | FONT

## Change colors in funct (ROFI)
change_rofi 'nordic' 'Iosevka 10' '0px' 'Numix-Apps'								# STYLE/DIR | FONT | BORDER | ICON

change_nm 'nordic'																	# CONFIG FILE DIR

## Change colors in funct (TERMINAL)
change_term 'Iosevka Custom' '9'													# FONT | SIZE

change_geany 'nordic' 'Iosevka Custom 10'											# SCHEME | FONT

change_gtk 'Nordic' 'Nordic-Folders' 'Nordic-Cursor' 'Noto Sans 9'					# THEME | ICON | CURSOR | FONT

## Change margin in funct (OPENBOX)
obconfig 'Nordic' 'LIMC' 'Noto Sans' '9' && openbox --reconfigure					# THEME | LAYOUT | FONT |SIZE

## Change colors in funct (DUNST)
change_dunst '280x50-10+48' 'Iosevka Custom 9' '0'									# GEOMETRY | FONT | BORDER

## Paste settings in funct (PLANK)
change_dock && cat "$HOME"/.cache/plank.conf | dconf load /net/launchpad/plank/docks/

## Other stuff
other_stuff 'black'
