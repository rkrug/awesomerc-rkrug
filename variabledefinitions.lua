
-- {{{ Variable definitions
-- Default modkey.
modkey = "Mod4"
altkey = "Mod1"

-- Environment programs
env = {
   browser = "chromium-browser ",
   email = "emacs --name Mail --title Mail --no-desktop --no-splash --funcall gnus ",
   man = "xterm -e man ",
   terminal = "xterm ", 
   grass7 = "xterm -title 'GRASS 7'",
   grass = "xterm -title 'GRASS'",
   -- screen = "xterm -e screen",
   fileman = "nautilus",
   terminal_root = "xterm -e su -c screen",
   im = "pidgin ",
   editor = os.getenv("EDITOR") or "ec ",
   home_dir = os.getenv("HOME"),
   music_show = "gmpc --replace",
   music_hide = "gmpc --quit",
   run = "gmrun",
   locker = "gnome-screensaver-command --activate",
   xkill = "xkill",
   poweroff = "sudo /sbin/poweroff",
   reboot = "sudo /sbin/reboot",
   hibernate = "sudo /usr/sbin/pm-hibernate",
   suspend = "sudo /usr/sbin/pm-suspend",
   logoutGnome = "/usr/bin/gnome-session-quit",
   rotate = "rotator",
   rfkill = { 
      wifi = "sudo /usr/local/bin/laptop-net wifi", 
      wimax = "sudo /usr/local/bin/laptop-net wimax",
      off = "sudo /usr/local/bin/laptop-net off"},
   syslog = "urxvt -e vim -T xterm-256color /var/log/messages",
   volumecontrol = "pavucontrol ",
   skype = "skype ",
   apps = "xfce4-appfinder",
}

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = 
   {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   -- awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   -- awful.layout.suit.tile.top,
   awful.layout.suit.fair,
   -- awful.layout.suit.fair.horizontal,
   -- awful.layout.suit.spiral.dwindle,
   -- awful.layout.suit.max.fullscreen,
   awful.layout.suit.magnifier,
   awful.layout.suit.spiral,
   awful.layout.suit.max,
   }
