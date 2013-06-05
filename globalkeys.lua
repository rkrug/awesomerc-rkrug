
globalkeys = awful.util.table.join(

-- Application hotkeys
awful.key({ modkey,           }, "Return", function () awful.util.spawn(env.terminal) end),
awful.key({ modkey            }, "b", function () awful.util.spawn(env.browser) end),
awful.key({ modkey            }, "e", function () awful.util.spawn(env.email)  end),
awful.key({ modkey,           }, "k", function () awful.util.spawn(env.locker) end),
awful.key({ modkey            }, "r", function () mypromptbox[mouse.screen]:run() end),
awful.key({ modkey, altkey    }, "r", function () awful.util.spawn(env.run) end),
-- awful.key({ modkey,           }, "m", function () run_or_raise("gmpc", { class = "Gmpc" }) end),
awful.key({ modkey            }, "p", function () awful.util.spawn(env.im) end),
-- awful.key({ modkey            }, "c", function () run_or_raise("xterm -e calc", { class="XTerm", name = "calc" }) end),
awful.key({ modkey,           }, "d", function () awful.util.spawn(env.editor) end),
awful.key({ modkey,           }, "v", function () awful.util.spawn(env.volumecontrol) end),
awful.key({ modkey,           }, "x", function () awful.util.spawn(env.apps) end),

-- Awesome control
awful.key({ modkey, "Control" }, "q", awesome.quit),
awful.key({ modkey, "Control" }, "r", function() mypromptbox[mouse.screen].widget.text = awful.util.escape(awful.util.restart()) end),

-- Client manipulation
awful.key({ altkey            }, "j", function () switch_to_client(-1) end),
awful.key({ altkey            }, "k", function () switch_to_client(1) end),
awful.key({ altkey            }, "1", function () switch_to_client(-1) end),
awful.key({ altkey            }, "2", function () switch_to_client(1) end),
awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(1) end),
awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx(-1) end),
-- awful.key({ altkey            }, "Tab", function() switch_to_client(0) end),

-- Layout manipulation
awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),

awful.key({ modkey, "Shift"   }, "Left", 
          function() 
             local s = mouse.screen == 1 and 2 or 1
             awful.tag.viewprev(screen[s])
          end), -- on other screen
awful.key({ modkey, "Shift"   }, "Right", 
          function() 
             local s = mouse.screen == 1 and 2 or 1
             awful.tag.viewnext(screen[s])
          end), -- on other screen

awful.key({ modkey,           }, "h", function () awful.tag.incmwfact(-0.05) end),
awful.key({ modkey,           }, "l", function () awful.tag.incmwfact(0.05) end),
awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incnmaster(1) end),
awful.key({ modkey, "Shift"   }, "l", function () awful.tag.incnmaster(-1) end),
awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol(1) end),
awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1) end),

awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts, 1) end),
awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
-- awful.key({ altkey,           }, "e", function () myrc.keybind.push_menu(chord_mpd(), chord_menu_args) end),

-- Multimedia keys
awful.key({ }, "XF86AudioRaqiseVolume", function () awful.util.spawn("pactl -- set-sink-volume 0 +10%") end),
awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("pactl -- set-sink-volume 0 -10%") end),
awful.key({ }, "XF86AudioMute", function () awful.util.spawn("") end)

)
