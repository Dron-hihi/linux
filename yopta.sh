#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"
D=$(date +%Y-%m-%d)
T=$(date +%H:%M:S)

echo -e "$GREEN Current user = $RED $USER $END \n"
echo -e "$GREEN Current data = $RED $D $END \n"
echo -e "$GREEN Current time = $RED $T $END \n"
echo -e "$GREEN Spase homedir = $RED `df -h /home`  $END \n"
echo -e "$GREEN IP = $RED `ifconfig enp0s3 | awk '{print $2}'` $END \n"
echo -e "$GREEN Lost 10 secure = $RED `tail -10 /var/log/messages` $END \n"
echo -e "$GREEN Active user = $RED `w` $END \n"
echo -e "$GREEN Uptime = $RED `uptime | awk '{print$3}'` $END \n"



while true;
do
clear
echo -e "\t 1.user"
echo -e "\t 2.data"
echo -e "\t 3.time"
echo -e "\t 4.uptime"
echo -e "\t 5.exit"

read x
case $x in
1)
echo "$USER"
;;
2)
echo "$D"
;;
3)
echo "$T"
;;
4)
echo "`uptime -p`"
;;
5)
exit 0
;;
*)
echo "error"
;;
esac
sleep 3
done


while true
do
clear
echo -e "\t 1.homedir "
echo -e "\t 2.ip"
echo -e "\t 3.lost 10 secure"
echo -e "\t 4.active user"
echo -e "\t 5.exit"

read z
case $z in
1)
echo "`df -h /home '{print $2}'` "
;;
2)
echo "`ifconfig enp0s3 | awk`"
;;
3)
echo "`tail -10 /var/log/messages`"
;;
4)
echo "`w`"
;;
5)
exit 0
;;
*)
echo "error"
;;
esac
sleep 3
done
