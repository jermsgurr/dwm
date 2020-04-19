#!/bin/sh

feh --bg-fill ~/Downloads/wall
sudo sh -c 'sysctl -w abi.vsyscall32=0'
picom &
while true; do

	date '+| %A :: %B %d :: %R |' > /tmp/CurTime.tmp

	sleep 60s
	done &
	while true; do

	LOCALTIME=$(< /tmp/CurTime.tmp)
	DISKFREE=$(df -Ph | grep "/dev/sda5" | awk {'print $4'})
	DISKUSED=$(df -Ph | grep "/dev/sda5" | awk {'print $3'})
	MEM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
	LINUX=$(uname -r)
	TOTALDOWN=$(ifconfig eno1| grep "RX packets" | awk {'print $6 $7'})
	TOTALUP=$(ifconfig eno1| grep "TX packets" | awk {'print $6 $7'})						     
     	xsetroot -name "$LOCALTIME  Kernel:$LINUX | Disk Free:$DISKFREE |  Mem:$MEM | TotalDown: $TOTALDOWN |"

	sleep 10s
	done &
exec dwm

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
