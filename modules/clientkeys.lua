
clientkeys = awful.util.table.join(
   awful.key({ modkey }, "F1", function (c) 
                local tag = myrc.tagman.getn(-1)
                awful.client.movetotag(tag, c)
                awful.tag.viewonly(tag)
                c:raise()
                               end),
   awful.key({ modkey }, "F2", function (c) 
                local tag = myrc.tagman.getn(1)
                awful.client.movetotag(tag, c)
                awful.tag.viewonly(tag)
                c:raise()
                               end),
   awful.key({ altkey }, "F4", function (c) c:kill() end),
   awful.key({ altkey }, "F5", function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c.maximized_vertical   = not c.maximized_vertical
                               end)
                                  )
