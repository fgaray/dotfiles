# .xinitrc

xrandr -s 0

xrdb $HOME/.Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'


# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ];
then
	eval `ssh-agent -s`
	ssh-add < /dev/null
fi

xset fp+ /usr/local/lib/X11/fonts/terminus
xset fp+ /usr/local/lib/X11/fonts/ghostscript
xset fp+ /usr/X11R6/lib/X11/fonts/TTF/

# xset fp rehash
xset b 100 0 0
xset r rate 200

xmodmap -e "keycode 233 = Page_Down"
xmodmap -e "keycode 234 = Page_Up"
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

# Map caps lock a escape
setxkbmap -option caps:escape 

setxkbmap -option terminate:ctrl_alt_bksp

# Oculta el mouse luego de 5 segundos de incactividad
unclutter &

# launch the external 60 second clock, and launch the workspace status bar
#FG='#a8a3f7' 
#BG='#3f3c6d' 
#xmonad-clock | dzen2 -e '' -x 400 -w 1200 -ta r -fg $FG -bg $BG &

feh --bg-scale Imagenes/haskell.png &
wmname LG3

setxkbmap latam
xmonad &
wmname LG3
termite -e tmux &
firefox &
#sudo hdparm -B 255 /dev/sda > /dev/null
wmname LG3

# wait for xmonad
wait $!
pkill -HUP dzen2
pkill -HUP -f xmonad-clock
wait

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
