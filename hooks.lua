
-- Hook function to execute when focusing a client.
client.add_signal("focus", 
                  function (c)
                     c.border_color = beautiful.border_focus;
                     c.opacity = 1.0
                  end)

-- Hook function to execute when unfocusing a client.
client.add_signal("unfocus", 
                  function (c)
                     c.border_color = beautiful.border_normal;
                     c.opacity = 0.9
                  end)

awful.hooks.mouse_enter.register(
   function (c)
      -- Sloppy focus, but disabled for magnifier layout
      if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
         and awful.client.focus.filter(c) then
      client.focus = c
      end
   end)
