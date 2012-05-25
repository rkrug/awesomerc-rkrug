
-- Hook function to execute when focusing a client.
client.add_signal("focus", function (c)
                     c.border_color = beautiful.border_focus
                           end)

-- Hook function to execute when unfocusing a client.
client.add_signal("unfocus", function (c)
                     c.border_color = beautiful.border_normal
                             end)

-- Will change border width for max layout
for s = 1, screen.count() do
   awful.tag.attached_add_signal(s,"property::layout", function()
                                    for _,c in pairs(awful.tag.selected():clients()) do
                                       c.border_width = get_layout_border(c)
                                    end
                                                       end)
end
