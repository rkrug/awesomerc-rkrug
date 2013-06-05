
-- Clock
mytextclock = {}
mytextclock = widget({ type = "textbox", align="right" })
pipelets.register_fmt(mytextclock, "date", " $1 ")

-- Mountbox
mymountbox = widget({ type = "textbox", align="right" })
pipelets.register_fmt( mymountbox, "mmount", " $1")

-- BatteryBox
mybatbox = widget({ type = "textbox", align="right" })
pipelets.register( mybatbox, "batmon")

-- Temp
mytemp = widget({ type = "textbox", align="right" })
pipelets.register_fmt( mytemp, "temp", " $1 ")
