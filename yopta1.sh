#! /bin/bash
file=/root/phonebook-all


RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"


LeghiyPoshuk (){ 
while true;
do
clear
echo -e "$GREEN \t 1.IMYA    \t 2.PRIZVISCHE  \t 3.VIK $END\n"
echo -e "$GREEN \t 4.TELEFON \t 5.E.MAIL      \t 6.MISTO $END\n"
echo -e "$GREEN \t 7.NIK     \t 8.POVERNUTYSY \t 9.EXIT $END\n"

read x

case $x in
1)
echo "`awk '{print $1}' /root/phonebook-all`"
;;
2)
echo "`awk '{print $2}' /root/phonebook-all`"
;;
3)
echo "`awk '{print $1 " " $3}' /root/phonebook-all`"
;;
4)
echo "`awk '{print $4}' /root/phonebook-all`"
;;
5)
echo "`awk '{print $5}' /root/phonebook-all`"
;;
6)
echo "`awk '{print $6}' /root/phonebook-all`"
;;
7)
echo "`awk '{print $7}' /root/phonebook-all`"
;;
8)
main
;;
9)
exit 0
;;
*)
echo "ERROR"
;;
esac
sleep 5
done
}

TyazkiyPoshuk (){
while true;
do
clear
echo -e "$GREEN \t 1.IMYA    \t 2.PRIZVISCHE  \t 3.VIK $END\n"
echo -e "$GREEN \t 4.TELEFON \t 5.E.MAIL      \t 6.MISTO $END\n"
echo -e "$GREEN \t 7.NIK     \t 8.POVERNUTYSY \t 9.EXIT $END\n"

read z
case $z in
1)
read q 
echo -e "`awk '{print $1 " " $2}' /root/phonebook-all | grep -i $q `\n"
;;
2)
read w
echo -e "`awk '{print $1 " " $2}' /root/phonebook-all | grep -i $w `\n"
;;
3)
read e
echo -e "`awk '{print $1 " " $3}' /root/phonebook-all | grep -i $e `\n"
;;
4)
read t
echo -e "`awk '{print $1 " " $4}' /root/phonebook-all | grep -i $t `\n"
;;
5)
read y
echo -e "`awk '{print $1 " " $5}' /root/phonebook-all | grep -i $y `\n"
;;
6)
read u
echo -e "`awk '{print $1 " " $6}' /root/phonebook-all | grep -i $u `\n"
;;
7)
read i
echo -e "`awk '{print $1 " " $7}' /root/phonebook-all | grep -i $i `\n"
;;
8)
main
;;
9)
exit 0
;;
*)
echo "ERROR"
;;
esac
sleep 5
done
}

Statistika(){
while true;
do
clear
echo -e " $RED \t 1.Stat Mista \t 2.Stat Email \t 3.Stat Vik $END\n"
echo -e " $RED \t\t 4.POVERNUTYSY \t 5.VIHID $END\n"
read c
case $c in
1)
citys=`awk '{print $6}' /root/phonebook-all`;
for i in $citys
do
if grep -oiE "$i" /root/phonecity >>/dev/null;
then
continue
else
echo "$i" >> /root/phonecity
fi
done
per=`cat /root/phonecity`
for i in $per
do
echo "$i -- `grep -ic "$i" phonebook-all`"
done
read 
;;
2)
mail=`awk '{print $5}' /root/phonebook-all`;
for i in $mail
do
if grep -oiE "$i" /root/phoneemail >>/dev/null;
then
continue
else
echo "$i" >> /root/phoneemail
fi
done
eee=`cat /root/phoneemail`
for i in $eee
do
echo "$i -- `grep -ic "$i" phonebook-all`"
done
read
;;
3)
echo "Vid 01 do 18 -> `awk '{print " " $3 " "}' /root/phonebook-all | grep -ce "1[0-8]" -e "[0-9]"`"
echo "Vid 18 do 25 -> `awk '{print " " $3 " "}' /root/phonebook-all | grep -ce "2[0-5]" -e "19"`"
echo "Vid 25 do ++ -> `awk '{print " " $3 " "}' /root/phonebook-all | grep -ce "2[6-9]" -e "[3-9][0-0]"`"
;;
4)
main
;;
5)
exit 0
;;
*)
echo "ERROR"
;;
esac
sleep 5
done
}

main (){
echo -e " $GREEN ************************* $END\n"
echo -e " $GREEN * $RED Lehkiy poshuk -> 1 $GREEN  * $END\n"
echo -e " $GREEN *                       * $END\n"
echo -e " $GREEN * $RED Tyazkiy poshuk -> 2 $GREEN * $END\n"
echo -e " $GREEN *                       * $END\n"
echo -e " $GREEN * $RED Statistika -> 3 $GREEN     * $END\n"
echo -e " $GREEN *                       * $END\n"
echo -e " $GREEN * $RED Vihid -> 4 $GREEN          * $END\n"
echo -e " $GREEN ************************* $END\n"

read c
case $c in
1)
LeghiyPoshuk
;;
2)
TyazkiyPoshuk
;;
3)
Statistika
;;
4)
exit 0
;;
*)
echo "ERROR"
;;
esac
sleep 3

}
main
