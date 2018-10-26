#! /bin/bash
url="https://app.bitpool.com/#/login?pane=organisation"
curl $url > index.html
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
END="\033[0m"
BLIM="\033[5m"
var=`grep "bpoAppVersion" index.html | grep -Eo "[0-9]+"` 
hh=`date "+%H"`
mm=`date "+%M"`
summ=$(($hh+$mm))
echo -e "$GREEN********************************************************************************$END\n"
echo -e "$YELLOW $var - znachennya saytu $END\n"
echo -e "$YELLOW $hh - godyny $END\n"
echo -e "$YELLOW $mm - hviliny $END\n"
echo -e "$YELLOW $summ - suma godyn i hvilyn $END\n"
if (( "$summ" > "$var" )); then
echo -e "$BLIM $RED $summ bilshe za znachennya saytu: $var $END\n"
elif (( "$summ" < "$var" ));then
echo -e "$BLIM $RED $var bilshe za sumu h+m: $summ $END\n"
else
echo -e "$BLIM $RISKA $RED Znachennya Rivni $END\n"
fi
echo -e "$GREEN********************************************************************************$END\n"
