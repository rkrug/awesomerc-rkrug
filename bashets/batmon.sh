#!/bin/sh

acpitool -b | while read line ; do

	batnum=`echo $line |  sed 's/.*#\(.\).*/\1/'`
	percent=`echo $line | sed 's/.*\:[^,]*, \([^,]*\).*/\1/'`
	if echo $line | grep -q discharging ; then
		color='#CC7777'
		tleft=`echo $line | sed 's/.*\:[^,]*, [^,]*, \(..:..\).*/\1/'`
	else
		color='#77CC77'
	fi

	echo "<span color='$color'>BAT#$batnum $percent $tleft</span>"

done
