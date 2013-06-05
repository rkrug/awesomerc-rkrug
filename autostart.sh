#!/bin/bash

#!/bin/bash
## Just to make sure, source .bash_profile and .bashrc
source ~/.bashstart &

###################
## start gnome-settings-daemon
gnome-settings-daemon &
###################
## start gnome keyring
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg &
export GNOME_KEYRING_SOCKET
export GNOME_KEYRING_PID
export GNOME_KEYRING_CONTROL
export SSH_AUTH_SOC
export GPG_AGENT_INFO
###################
## start udisks-glue to enable automount
run_once udisks-glue
## use policykit to deal with passwordpromt when starting e.g. synaptic
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
####################
## start recollindex usin ionice Idle
ionice -c 3 recollindex -m
###################
## start emacs daemon
run_once emacs --daemon
###################


###################
## run redshift for actual location
gtk-redshift -l 48.570236:1.963693 &
###################
## start network applett
# wicd-gtk &
run_once nm-applet
###################
## start gnome-do
run_once gnome-do
###################
## start bluetooth-applets
run_once bluetooth-applet
run_once blueman-applet
###################
## start spideroak
run_once SpiderOak
###################
## start dropbox daemon
run_once dropboxd
###################
## start skype
run_once skype
###################
## start cryptkeeper
run_once cryptkeeper
###################
## start radiotray webradio player
run_once radiotray
###################


###################
## set background
nitrogen --restore &
###################

###################
## start conky
run_once conky -c /home/rkrug/.conky/conkyrc
###################

###################
## start calendar indicatorr
run_once calendar-indicator
###################

# # ~/bin/adjustMonitor

# ## Just to make sure, source .bash_profile and .bashrc
# ## source ~/.bash_profile &
# ## source ~/.bashrc &

# ###################
# ## start avant window manager
# avant-window-navigator &
# ###################
# ## set caps lock as compose key
# setxkbmap -option compose:caps &
# ###################
# ## disable touchpad when typing
# syndaemon -d -i 2 &
# ###################
# ## autostart using Freedesktop specifications 
#  # fbautostart &
# ###################
# ## start gnome volume control
#  # gnome-volume-control-applet &
# ###################
# ## start gnome power manager
#  # gnome-power-manager &
# ###################
# ## start ejecter
#  # ejecter &
# ###################
# ## start screenlets
#  # screenlets-daemon &
# ###################
# ## start workrave
# workrave &
# ###################
# ## start tasque for management of RTM
#  # tasque &
# ###################
# ## start qwit twitter client
# # qwit &
# ###################
# ## start mail-notification
#  # mail-notification &
# ###################
# ## start guake
# ## run_once guake & 
###################
