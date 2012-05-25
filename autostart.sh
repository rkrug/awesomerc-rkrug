#!/bin/bash

#!/bin/bash
 # ~/bin/adjustMonitor

## Just to make sure, source .bash_profile and .bashrc
## source ~/.bash_profile &
## source ~/.bashrc &

###################
## set caps lock as compose key
setxkbmap -option compose:caps &
###################
## disable touchpad when typing
syndaemon -d -i 2 &
###################
## autostart using Freedesktop specifications 
 # fbautostart &
###################
## start gnome keyring
/usr/bin/gnome-keyring-daemon --start --components=ssh
###################
## start conky
 # conky -c /home/rkrug/.conky/conkyrc &
###################
## start gnome volume control
 # gnome-volume-control-applet &
###################
## start network applett
# wicd-gtk &
run_once nm-applet &
###################
## start gnome power manager
 # gnome-power-manager &
###################
## start gnome-do
 # gnome-do &
###################
## start bluetooth-applets
 # bluetooth-applet &
run_once blueman-applet &
###################
## start ejecter
 # ejecter &
###################
## start spideroak
 # run_once SpiderOak &
###################
## start screenlets
 # screenlets-daemon &
###################
## start workrave
 # workrave &
###################
## start tasque for management of RTM
 # tasque &
###################
## start udisks-glue to enable automount
run_once udisks-glue & 
###################
## start avant window manager
 # avant-window-navigator &
###################
## start skype
run_once skype.video &
###################
## start qwit twitter client
# qwit &
###################
## start radiotray webradio player
run_once radiotray &
###################
## start mail-notification
 # mail-notification &
###################
## set background
 # fbsetbg -a -u feh -r ~/Pictures/Katharina/2010 &
 # nitrogen --restore &
###################
## start guake
## run_once guake & 
###################
## start recollindex usin ionice Idle
ionice -c 3 recollindex -m &
###################
## start emacs daemon
run_once emacs --daemon &
###################
