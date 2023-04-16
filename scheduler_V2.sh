#!/bin/bash
SYS_DAY=$(date +%A)
SYS_DATE=$(date +%d)
WEEKDAYS=(Monday,Tuesday,Wednesday,Thursday,Friday)
WEEKEND=(Saturday,Sunday)
RUNAT=$(date +%H:%M)

days=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
dates=( $(seq 1 15 ) )

weekday() {
if [[  ($SYS_DATE -le 15 && "$SYS_DAY" != "Saturday")  || ($SYS_DATE -le 15 && "$SYS_DAY" != "Sunday") ]]
#if [[  ($SYS_DATE -ge 15 && "$SYS_DAY" == "Saturday")  || ($SYS_DATE -le 15 && "$SYS_DAY" != "Sunday") ]]
then
	#6 am 3pm on weekdays : 1-15 of everymonth
	if [[ ("$RUNAT" == "06:00") ||  ("$RUNAT" == "15:00") ]]
	then
		echo "Below 15..Run the script at scheduled time"
	fi	
elif [[  ($SYS_DATE -gt 15 && "$SYS_DAY" != "Saturday")  || ($SYS_DATE -gt 15 && "$SYS_DAY" != "Sunday") ]]
then
	if  [[ "$RUNAT" == "13:24" ]]
	then
		#09 am on weekdays : 16-30 of everymonth
		echo "Above 15...Run the script at scheduled time"
	fi
elif [[ ("$SYS_DAY" == "Saturday" ) || ("$SYS_DAY" == "Sunday" ) ]]
then
	if [[ ("$RUNAT" == "10:00") ||  ("$RUNAT" == "20:00") ]]
	then
		echo "10 am and 8 pm on weekends"
	fi
else
	echo " "
	
fi	
}
weekedn() {
#10 am and 8 pm on weekends
if [[ ("$SYS_DAY" == "Saturday" ) || ("$SYS_DAY" == "Sunday" ) ]]
then
	echo "10 am and 8 pm on weekends"
else
	echo "Not a weekend"
fi
}
weekday
#weekedn

