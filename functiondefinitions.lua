
function fullscreens(c)
     awful.client.floating.toggle(c)
     if awful.client.floating.get(c) then
         local clientX = screen[1].workarea.x
         local clientY = screen[1].workarea.y
         local clientWidth = 2147483640
         -- look at http://www.rpm.org/api/4.4.2.2/llimits_8h-source.html
         local clientHeight = 0
         for s = 1, screen.count() do
             clientHeight = clientHeight + screen[s].workarea.height
             clientWidth = math.min(clientWidth, screen[s].workarea.width)
         end
         local t = c:geometry({x = clientX, y = clientY, width = clientWidth, height = clientHeight})
     else
         --apply the rules to this client so he can return to the right tag if there is a rule for that.
         awful.rules.apply(c)
     end
     -- focus our client
     client.focus = c
 end

awful.util.spawn_with_shell("xrandr -q >/home/rkrug/.config/awesome/xrandrtable")
function xrandr_screens ()
   local screens = {}
   local counter = 1
   local handle = io.popen("cat /home/rkrug/.config/awesome/xrandrtable")
   for display in handle:read("*all"):gmatch("([%a%d-]+) connected") do
      screens[display] = counter
      counter = counter + 1
   end
   handle:close()
   return screens
end
screens = xrandr_screens()
