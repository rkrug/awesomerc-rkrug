
-- default rc.lua for shifty
--
-- Standard awesome library
require("awful")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- shifty - dynamic tagging library
require("shifty")

-- Load Debian menu entries
-- require("debian.menu")  

-- load runonce.lua
local r = require("runonce")

-- useful for debugging, marks the beginning of rc.lua exec
print("Entered rc.lua: " .. os.time())

-- Variable definitions
-- Themes define colours, icons, and wallpapers
-- The default is a dark theme
theme_path = "/home/rkrug/.config/awesome/themes/default/theme.lua"
-- Uncommment this for a lighter theme
-- theme_path = "/usr/share/awesome/themes/sky/theme"

beautiful.init(theme_path)

config = awful.util.getdir("config")

dofile(config .. "/variabledefinitions.lua")

dofile(config .. "/functiondefinitions.lua")

-- Define if we want to use titlebar on all applications.
use_titlebar = false

-- Shifty configured tags.
shifty.config.tags = {
   --Screen 1--
   s1 = {
      layout    = awful.layout.suit.floating,
      exclusive = false,
      screen    = 1,
      position  = 1,
      init      = true,
      slave     = false,
      persist = true,
   },
   mail = {
      layout    = awful.layout.suit.tile,
      mwfact    = 0.55,
      exclusive = false,
      position  = 2,
      screen    = 1,
      spawn     = env.email,
      slave     = true
   },
   VM = {
      layout    = awful.layout.suit.tile,
      mwfact    = 0.55,
      exclusive = false,
      screen    = 1,
      slave     = false
   },
   media = {
      layout    = awful.layout.suit.float,
      screen    = 1,
      exclusive = false,
      position  = 9,
      slave     = true
   },
   emacs = {
      layout   = awful.layout.suit.tile,
      exclusive = false,
      position = 11,
      screen    = 1,
      slave    = true,
      spawn    = env.editor,
      exclusive = false,
   },
  --Screen 2--
   s2 = {
      layout    = awful.layout.suit.floating,
      exclusive = false,
      screen    = math.max(screen.count(), 1),
      position  = 1,
      init      = true,
      slave     = false,
      persist = true,
   },
   IM = {
      layout      = awful.layout.suit.tile,
      mwfact      = 0.65,
      exclusive   = false,
      screen      = math.max(screen.count(), 1),
      position    = 2,
      spawn       = env.im
   },
   web = {
      layout      = awful.layout.suit.tile,
      mwfact      = 0.65,
      exclusive   = false,
      screen      = math.max(screen.count(), 1),
      position    = 3,
      spawn       = env.browser,
   },
   grass = {
      layout      = awful.layout.suit.tile,
      mwfact      = 0.65,
      exclusive   = false,
      screen      = math.max(screen.count(), 1),
      position    = 10,
      spawn       = env.grass7,
   },
   --Wherever--
   office = {
      layout   = awful.layout.suit.tile,
      position = 9,
      persist  = true,
      init     = false,
   },
   GIS = {
      layout   = awful.layout.suit.tile,
      position = 10,
      persist = true,
      init      = false,
   },
}

-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
   {
      match = {
         "emacs@ecolmod",
         "Emacs",
         "emacs"
      },
      tag = "emacs"
   },
   {
      match = {
         -- "Navigator",
         "Vimperator",
         "Gran Paradiso",
         "Firefox", 
         "chromium-browser",
         "Chromium-browser",
         "chromium",
         "Chromium",
         "midori",
         "Midori",
         "Navigator", 
         "Conkeror"
      },
      tag = "web",
   },
   {
      match = {
         "Mail",
         "Shredder.*",
         "Thunderbird",
         "Thunderbird*",
         "thunderbird",
         "mutt",
         "Zimbra Desktop",
         "Zimbra*",
         "Pan"
      },
      tag = "mail",
   },
   {
      match = {
         "GRASS GIS",
         "GRASS 7",
         "GRASS",
      },
      tag = "grass",
   },
   {
      match = {
         "qgis",
         "Qgis"
      },
      tag = "GIS",
   },
   {
      match = {
         "Pidgin",
         "Skype",
      },
      tag = "IM",
   },
   {
      match = {
         "pcmanfm",
      },
      slave = true
   },
   {
      match = {
         "VirtualBox",
      },
      tag = "VM"
   },
   {
      match = {
         "libreoffice-*",
         "LibreOffice",
         "Abiword",
         "Gnumeric",
         "Lyx",
         "WINWORD.EXE",
         "POWERPNT.EXE",
         "mendeleydesktop", 
         "Mendeleydesktop",
         "Mendeley Desktop",
      },
      tag = "office",
   },
   {
      match = {
         "Mplayer.*",
         "Mirage",
         "gimp",
         "gtkpod",
         "Ufraw",
         "easytag",
         "banshee",
         "Banshee",
         "amarok",
         "Amarok",
         "MusicBrainz Picard", 
         "spotify", 
         "Spotify",
         "google-musicmanager", 
         "Google-musicmanager",
         "xscanimage", 
         "Xscanimage"
      },
      tag = "media",
      -- nopopup = true,
   },
   {
      match = {
         "MPlayer",
         "Gnuplot",
         "galculator",
      },
      float = true,
   },
   {
      match = {
         env.terminal,
      },
      honorsizehints = false,
      slave = true,
   },
   {
      match = {""},
      buttons = awful.util.table.join(
         awful.button({}, 1, function (c) client.focus = c; c:raise() end),
         awful.button({modkey}, 1, function(c)
                         client.focus = c
                         c:raise()
                         awful.mouse.client.move(c)
                                   end),
         awful.button({modkey}, 3, awful.mouse.client.resize)
                                     )
   },
}

-- SHIFTY: default tag creation rules
-- parameter description
--  * floatBars : if floating clients should always have a titlebar
--  * guess_name : should shifty try and guess tag names when creating
--                 new (unconfigured) tags?
--  * guess_position: as above, but for position parameter
--  * run : function to exec when shifty creates a new tag
--  * all other parameters (e.g. layout, mwfact) follow awesome's tag API
shifty.config.defaults = {
   layout = awful.layout.suit.tile.bottom,
   ncol = 1,
   mwfact = 0.60,
   floatBars = true,
   guess_name = true,
   guess_position = true,
   persist = false,
}

--  Wibox
-- Create a textbox widget
mytextclock = awful.widget.textclock({align = "right"})

myawesomemenu = {
   { "manual", env.terminal .. " -e man awesome" },
   { "edit config", env.editor .. " " .. awful.util.getdir("config") .. "/rc.lua.org" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

myquitmenu = {
   { "&Poweroff", env.poweroff }, 
   { "&Reboot", env.reboot }, 
   { "&Hibernate", env.hibernate }, 
   { "&Suspend", env.suspend }, 
   { "&Logout", awesome.quit },
   { "Logout &GNOME", env.logoutGnome }
}

mymainmenu = awful.menu({ items = { 
                             { "awesome", myawesomemenu, beautiful.awesome_icon },
                             -- { "Debian", debian.menu.Debian_menu.Debian },
                             { "open terminal", env.terminal },
                             { "", nil, nil}, --separator
                             { "&quit", myquitmenu },
                                  }
                        })

mylauncher = awful.widget.launcher({image = image(beautiful.awesome_icon),
                                    menu = mymainmenu})

-- Create a systray
mysystray = widget({type = "systray", align = "right"})

mytaglist = {}
mytaglist.buttons = awful.util.table.join(
   awful.button({}, 1, awful.tag.viewonly),
   awful.button({modkey}, 1, awful.client.movetotag),
   awful.button({}, 3, function(tag) tag.selected = not tag.selected end),
   awful.button({modkey}, 3, awful.client.toggletag),
   awful.button({}, 4, awful.tag.viewnext),
   awful.button({}, 5, awful.tag.viewprev)
                                         )

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
   awful.button({}, 1, function(c)
                   if not c:isvisible() then
                      awful.tag.viewonly(c:tags()[1])
                   end
                   client.focus = c
                   c:raise()
                       end),
   awful.button({}, 3, function()
                   if instance then
                      instance:hide()
                      instance = nil
                   else
                      instance = awful.menu.clients({width=250})
                   end
                       end),
   awful.button({}, 4, function()
                   awful.client.focus.byidx(1)
                   if client.focus then client.focus:raise() end
                       end),
   awful.button({}, 5, function()
                   awful.client.focus.byidx(-1)
                   if client.focus then client.focus:raise() end
                       end))

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}

for s = 1, screen.count() do
   -- Create a promptbox for each screen
   mypromptbox[s] =
      awful.widget.prompt({layout = awful.widget.layout.leftright})
   -- Create an imagebox widget which will contains an icon indicating which
   -- layout we're using.  We need one layoutbox per screen.
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(awful.util.table.join(
                             awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
                             awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
                             awful.button({}, 4, function() awful.layout.inc(layouts, 1) end),
                             awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)))
   -- Create a taglist widget
   mytaglist[s] = awful.widget.taglist.new(s,
                                           awful.widget.taglist.label.all,
                                           mytaglist.buttons)
   
   -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist.new(function(c)
                                                return awful.widget.tasklist.label.currenttags(c, s)
                                             end,
                                             mytasklist.buttons)
   
   -- Create the wibox
   mywibox[s] = awful.wibox({position = "top", screen = s})
   -- Add widgets to the wibox - order matters
   mywibox[s].widgets = {
      {
         mylauncher,
         mylayoutbox[s],
         mytaglist[s],
         mypromptbox[s],
         layout = awful.widget.layout.horizontal.leftright
      },
      mytextclock,
      s == 1 and mysystray or nil,
      mytasklist[s],
      layout = awful.widget.layout.horizontal.rightleft
   }
   
   mywibox[s].screen = s
end

-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()

-- Mouse bindings
root.buttons({
                awful.button({}, 1, function () mymainmenu:hide() end),
                awful.button({}, 3, function() mymainmenu:toggle() end),
                awful.button({}, 4, awful.tag.viewnext),
                awful.button({}, 5, awful.tag.viewprev)
             })

dofile(config .. "/clientbuttons.lua")

dofile(config .. "/globalkeys.lua")

globalkeys = awful.util.table.join(
   globalkeys,
   -- Shifty: keybindings specific to shifty
   awful.key({modkey, "Shift"}, "d", shifty.del), -- delete a tag
   awful.key({modkey, "Shift"}, "a", shifty.add), -- create a new tag
   awful.key({modkey, "Shift"}, "r", shifty.rename), -- rename a tag
   -- awful.key({modkey, "Shift"}, "a", -- nopopup new tag
   --    function()
   --    shifty.add({nopopup = true})
   --    end)

   awful.key({modkey, }, "F1", shifty.send_prev), -- client to prev tag
   awful.key({modkey  }, "F2", shifty.send_next), -- client to next tag
   awful.key({modkey, "Control"}, "n", 
             function()
                shifty.tagtoscr(awful.util.cycle(screen.count(), mouse.screen + 1))
             end) -- move client to next tag
                                  )
-- Compute the maximum number of digit we need, limited to 9
for i = 1, (shifty.config.maxtags or 9) do
   globalkeys = awful.util.table.join(
      globalkeys,
      awful.key(
         {modkey}, i, 
         function()
            local t =  awful.tag.viewonly(shifty.getpos(i))
         end),
      awful.key(
         {modkey, "Control"}, i, 
         function()
            local t = shifty.getpos(i)
            t.selected = not t.selected
         end),
      awful.key(
         {modkey, "Control", "Shift"}, i, 
         function()
            if client.focus then
               awful.client.toggletag(shifty.getpos(i))
            end
         end),
      -- move clients to other tags
      awful.key(
         {modkey, "Shift"}, i, 
         function()
            if client.focus then
               t = shifty.getpos(i)
               awful.client.movetotag(t)
               awful.tag.viewonly(t)
            end
         end)
                                     )

end

-- Set keys
root.keys(globalkeys)

dofile(config .. "/clientkeys.lua")

-- SHIFTY: assign client keys to shifty for use in
-- match() function(manage hook)
shifty.config.clientkeys = clientkeys
shifty.config.modkey = modkey

dofile(config .. "/hooks.lua")

-- awful.util.spawn_with_shell("~/adjustMonitor")
-- awful.util.spawn_with_shell("/usr/bin/lxpanel")
-- awful.util.spawn_with_shell("/usr/bin/avant-window-navigator")
-- awful.util.spawn_with_shell("setxkbmap -option compose:caps")
-- awful.util.spawn_with_shell("gnome-settings-daemon && dex -a -e Awesome")
-- r.run("gnome-settings-daemon")
r.run("~/.config/awesome/autostart.sh")
