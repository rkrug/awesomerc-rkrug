
clientkeys = awful.util.table.join( 
   awful.key({ modkey }, "F1", 
             function (c) 
                local tag = myrc.tagman.getn(-1)
                awful.client.movetotag(tag, c)
                awful.tag.viewonly(tag)
                c:raise()
             end),
   awful.key({ modkey }, "F2", 
             function (c) 
                local tag = myrc.tagman.getn(1)
                awful.client.movetotag(tag, c)
                awful.tag.viewonly(tag)
                c:raise()
             end),
   awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
   awful.key({ modkey, "Control" }, "f",      fullscreens),
   awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
   awful.key({ modkey,           }, "a",  awful.client.floating.toggle                     ),
   awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
   awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
   awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
   awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
   -- awful.key({ altkey,           }, "h",      function (c) .maximized_horizontal = not c.maximized_horizontal  end),
   -- awful.key({ altkey,           }, "v",      function (c) .maximized_vertical = not c.maximized_vertical  end),
   awful.key({ modkey }, "m", 
             function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c.maximized_vertical   = not c.maximized_vertical
             end)

                                  )
